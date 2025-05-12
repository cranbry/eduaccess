<?php
require __DIR__ . '/db.php';

// to run queries on $pdo:
$stmt = $pdo->query("SELECT * FROM resources");
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($rows);
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "eduaccess");

if ($conn->connect_error) {
  http_response_code(500);
  echo json_encode([ "error" => $conn->connect_error ]);
  exit;
}

$result = $conn->query("SELECT * FROM tutors");
echo json_encode($result->fetch_all(MYSQLI_ASSOC));
$conn->close();
