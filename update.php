<?php
$conn = new mysqli("localhost", "root", "", "eduaccess");

$data = json_decode(file_get_contents("php://input"), true);

$sql = "UPDATE resources SET title=?, type=?, subject=?, description=?, uploaded_by=?, date_uploaded=? WHERE id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssssi", $data['title'], $data['type'], $data['subject'], $data['description'], $data['uploaded_by'], $data['date_uploaded'], $data['id']);
$stmt->execute();

echo "Resource updated successfully";
$conn->close();
?>
