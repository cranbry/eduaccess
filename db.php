<?php
// db.php

// 1) Grab the Railway URL, or fall back to localhost
$url = getenv('MYSQL_URL');
if (!$url) {
    // local XAMPP / MAMP
    $dsn   = 'mysql:host=127.0.0.1;dbname=eduaccess;charset=utf8';
    $user  = 'root';
    $pass  = '';
} else {
    // parse mysql://user:pass@host:port/dbname
    $parts = parse_url($url);
    $host  = $parts['host'];
    $port  = $parts['port'];
    $name  = ltrim($parts['path'], '/');
    $user  = $parts['user'];
    $pass  = $parts['pass'];
    $dsn   = "mysql:host={$host};port={$port};dbname={$name};charset=utf8";
}

// 2) Create the PDO
try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
} catch (PDOException $e) {
    error_log("DB connection failed: " . $e->getMessage());
    http_response_code(500);
    exit("Database error");
}
