<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "eduaccess");

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "Database connection failed"]);
    exit;
}

$query = $_GET['q'] ?? '';

$sql = "SELECT * FROM resources WHERE title LIKE ? OR description LIKE ?";
$stmt = $conn->prepare($sql);
$param = "%$query%";
$stmt->bind_param("ss", $param, $param);
$stmt->execute();
$result = $stmt->get_result();

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
$conn->close();
?>
