<?php 

session_start(); 
require_once 'database_connection/dbconn.php';

$response = ['success' => false, 'message' => ''];

if (isset($_POST['email']) && isset($_POST['password'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Prepared statement to prevent SQL injection
        $stmt = $conn->prepare("SELECT * FROM tblaccounts WHERE email = :email AND password = :password");
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':passwordword', $password);
        $stmt->execute();

        if ($stmt->rowCount() == 1) {
            $_SESSION['email'] = $email;
            $_SESSION['password'] = $password;
            $response['success'] = true;
            $response['message'] = 'Login successful';
        } else {
            $response['message'] = 'Incorrect Username or Password';
        }
    } catch(PDOException $e) {
        // Handle database connection error
        $response['message'] = 'Database Error: ' . $e->getMessage();
    }
} else {
    $response['message'] = 'Both email and password are required';
}

echo json_encode($response);
?>
