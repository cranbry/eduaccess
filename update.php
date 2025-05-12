<?php
header("Content-Type: application/json");
ini_set('display_errors',1);
error_reporting(E_ALL);

// same schema whitelist
$schema = [
  "resources" => ["title","type","subject","description","uploaded_by","date_uploaded"],
  "tutors"    => ["name","subject","expertise"],
  "workshops" => ["topic","date","location","host","capacity"]
];

$table = $_GET['table'] ?? "";
if (! isset($schema[$table])) {
  http_response_code(400);
  exit(json_encode(["error"=>"Invalid table"]));
}

// parse JSON body
$data = json_decode(file_get_contents("php://input"), true);
$id   = intval($data['id'] ?? 0);
if (!$id) {
  http_response_code(400);
  exit(json_encode(["error"=>"Missing id"]));
}

$sets = [];
$types  = "";
$values = [];
foreach ($schema[$table] as $col) {
  if (isset($data[$col])) {
    $sets[]    = "`$col` = ?";
    $types    .= ($col==="capacity" ? "i":"s");
    $values[]  = $data[$col];
  }
}

if (empty($sets)) {
  http_response_code(400);
  exit(json_encode(["error"=>"No fields to update"]));
}

$sql = "UPDATE `$table` SET " 
     . implode(",", $sets) 
     . " WHERE id = ?";
$types    .= "i";
$values[]  = $id;

$conn = new mysqli("localhost","root","","eduaccess");
if ($conn->connect_error) {
  http_response_code(500);
  exit(json_encode(["error"=>$conn->connect_error]));
}

$stmt = $conn->prepare($sql);
$stmt->bind_param($types, ...$values);
$stmt->execute();

echo json_encode(["success"=>true, "affected_rows"=>$stmt->affected_rows]);
$conn->close();
