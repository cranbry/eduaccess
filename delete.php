<?php
header("Content-Type: application/json");
ini_set('display_errors',1);
error_reporting(E_ALL);

$table = $_GET['table'] ?? "";
$id    = intval($_GET['id'] ?? 0);
$allowed = ["resources","tutors","workshops"];

if (! in_array($table, $allowed) || !$id) {
  http_response_code(400);
  exit(json_encode(["error"=>"Invalid request"]));
}

$conn = new mysqli("localhost","root","","eduaccess");
if ($conn->connect_error) {
  http_response_code(500);
  exit(json_encode(["error"=>$conn->connect_error]));
}

$stmt = $conn->prepare("DELETE FROM `$table` WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

echo json_encode(["success"=>true, "deleted_rows"=>$stmt->affected_rows]);
$conn->close();
