<?php
$conn = new mysqli("localhost", "root", "", "eduaccess");

$id = $_GET['id'];
$sql = "DELETE FROM resources WHERE id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();

echo "Resource deleted successfully";
$conn->close();
?>
