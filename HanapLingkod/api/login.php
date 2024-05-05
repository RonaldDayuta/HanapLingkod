<?php
session_start();

// Database connection
$host = "localhost";
$username = "root";
$password = "";
$dbname = "dbhanaplingkod";
$conn = mysqli_connect($host, $username, $password, $dbname);

$response = ['success' => false, 'message' => '', 'redirect_url' => ''];

if ($conn) {
    if (isset($_POST['email']) && isset($_POST['password'])) {
        $email = trim($_POST['email']); // Trim whitespace
        $password = $_POST['password']; // No need to trim password

        // Escape user inputs to prevent SQL injection
        $email = mysqli_real_escape_string($conn, $email);

        $query = "SELECT * FROM tblaccounts WHERE email = '$email'";
        $result = mysqli_query($conn, $query);

        if ($result) {
            if (mysqli_num_rows($result) == 1) {
                $row = mysqli_fetch_assoc($result);
                // Check if the entered password matches the one stored in the database
                if ($password == $row['password']) {
                    // Password matches, set session variables
                    $_SESSION['email'] = $email;
                    $_SESSION['position'] = $row['position'];
                    $response['success'] = true;
                    $response['message'] = 'Login successful';
                    // Set the redirection URL based on user's position
                    switch ($row['position']) {
                        case 'admin':
                            $response['redirect_url'] = 'admin.html';
                            break;
                        case 'worker':
                            $response['redirect_url'] = 'worker.html';
                            break;
                        case 'recruiter':
                            $response['redirect_url'] = 'recruiter.html';
                            break;
                        default:
                            $response['redirect_url'] = 'sign-in.html';
                    }
                } else {
                    $response['message'] = 'Incorrect Password';
                }
            } else {
                $response['message'] = 'User with this email does not exist';
            }
        } else {
            $response['message'] = 'Query Error: ' . mysqli_error($conn);
        }
    } else {
        $response['message'] = 'Both email and password are required';
    }
} else {
    $response['message'] = 'Database Connection Error: ' . mysqli_connect_error();
}

// Send JSON response
header('Content-Type: application/json');
echo json_encode($response);

// Close database connection
mysqli_close($conn);
?>
