<?php
$conn = new mysqli("localhost", "root", "", "eduaccess");

if ($conn->connect_error) {
    die("Connection failed");
}

$title = $_POST['title'];
$type = $_POST['type'] ?? null;
$subject = $_POST['subject'] ?? null;
$description = $_POST['description'];
$uploaded_by = $_POST['uploaded_by'] ?? null;
$date_uploaded = $_POST['date_uploaded'] ?? null;

$sql = "INSERT INTO resources (title, type, subject, description, uploaded_by, date_uploaded) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssss", $title, $type, $subject, $description, $uploaded_by, $date_uploaded);
$stmt->execute();

echo "Resource added successfully";
$conn->close();
?>
