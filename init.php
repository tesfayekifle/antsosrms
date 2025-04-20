<?php
// Database connection variables
$host = "sql12.freesqldatabase.com";  // Update with your remote host
$dbname = "sql12774262";               // Database name
$username = "sql12774262";             // Database user
$password = "B8YYRL6WMZ";              // Database password
$port = 3306;                          // Port number (can be omitted if it's the default)

// Create the connection
$conn = mysqli_connect($host, $username, $password, $dbname, $port);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
?>