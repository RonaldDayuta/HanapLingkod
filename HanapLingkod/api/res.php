<?php
include 'validation.php';

// Database connection
$host = "localhost";
$username = "root";
$password = "";
$dbname = "dbhanaplingkod";
$conn = mysqli_connect($host, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize response array
$response = array();

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Call the function to validate and insert form data
    $response = validateAndInsert($conn, $_POST, $_FILES);
} else {
    $response['success'] = false;
    $response['message'] = 'Invalid request method.';
}

// Return JSON response
echo json_encode($response);

?>
