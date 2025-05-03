<?php
$host = 'dpg-d02g7abuibrs73arpbbg-a.oregon-postgres.render.com';
$dbname = 'antsokiya_postgres_db';
$username = 'antsokiya_postgres_db_user';
$password = 'uvYoGgq6gfdTZWpBEl7aund6wJfYvxAv';
$port = 5432;

try {
    $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Connected to PostgreSQL successfully.";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>