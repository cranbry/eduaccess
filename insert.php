<?php
header("Content-Type: application/json");
ini_set('display_errors',1);
error_reporting(E_ALL);

// whitelisted columns per table
$schema = [
  "resources" => ["title","type","subject","description","uploaded_by","date_uploaded","tutor_id","workshop_id"],
  "tutors"    => ["name","subject","availability","contact_email"],
  "workshops" => ["topic","date","location","host","capacity"]
];

// get table name from the URL
$table = $_GET['table'] ?? "";
if (! isset($schema[$table])) {
  http_response_code(400);
  exit(json_encode(["error"=>"Invalid table"]));
}

// build field list & placeholders
$fields = [];
$placeholders = [];
$types = "";
$values = [];

// collect only allowed POST fields
foreach ($schema[$table] as $col) {
  if (isset($_POST[$col]) && $_POST[$col] !== "") {
    $fields[]       = "`$col`";
    $placeholders[] = "?";
    $types         .= ($col==="capacity" ? "i":"s");
    $values[]       = $_POST[$col];
  }
}

if (empty($fields)) {
  http_response_code(400);
  exit(json_encode(["error"=>"No data provided"]));
}

$sql = "INSERT INTO `$table` (" 
     . implode(",", $fields) 
     . ") VALUES (" 
     . implode(",", $placeholders) 
     . ")";

$conn = new mysqli("localhost","root","","eduaccess");
if ($conn->connect_error) {
  http_response_code(500);
  exit(json_encode(["error"=>$conn->connect_error]));
}

$stmt = $conn->prepare($sql);
$stmt->bind_param($types, ...$values);
$stmt->execute();

echo json_encode(["success"=>true, "insert_id"=>$stmt->insert_id]);
$conn->close();
