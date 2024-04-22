<?php

$host = "localhost";
$dbname = "";
$username = "root";
$password = "";
$email = $_POST['user'];
$password = $_POST['pass'];


$response = array('success' => false, 'message' => '');

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    $response['message'] = "Connection Failed! " . $e->getMessage();
    echo json_encode($response);
    exit();
}

if (isset($_POST['user']) && $_POST['user'] != '' &&
    isset($_POST['pass']) && $_POST['pass'] != '') {
    $sql = "SELECT * FROM tblaccounts WHERE user = :user AND pass = :pass";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':user', $user);
    $stmt->bindParam(':pass', $pass);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $response['success'] = true;
        $response['message'] = "Login successful";
    } else {
        $response['message'] = "Incorrect Username or Password";
    }
} elseif (isset($_POST['user']) && $_POST['user'] == '') {
    $response['message'] = "Username is required";
} elseif (isset($_POST['pass']) && $_POST['pass'] == '') {
    $response['message'] = "Password is required";
} else {
    $response['message'] = "Username and Password are required";
}

echo json_encode($response);
?>
