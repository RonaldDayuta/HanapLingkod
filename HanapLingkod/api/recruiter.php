<?php
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
$error = [];

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Initialize array to store empty fields
    $emptyFields = array();

    // Check each required field individually
    if (empty($_POST['username'])) {
        $emptyFields[] = 'Username';
        $error['username'] = 'Username is required';
    }
    if (empty($_POST['password'])) {
        $emptyFields[] = 'Password';
        $error['password'] = 'Password is required';
    }
    if (empty($_POST['Birthday'])) {
        $emptyFields[] = 'Birthday';
        $error['Birthday'] = 'Birthday is required';
    }
    if (empty($_POST['age'])) {
        $emptyFields[] = 'Age';
        $error['age'] = 'Age is required';
    }
    if (empty($_POST['sex'])) {
        $emptyFields[] = 'Sex';
        $error['sex'] = 'Sex is required';
    }
    if (empty($_POST['homeAddress'])) {
        $emptyFields[] = 'Home Address';
        $error['homeAddress'] = 'Home Address is required';
    }
    if (empty($_POST['phoneno'])) {
        $emptyFields[] = 'Phone Number';
        $error['phoneno'] = 'Phone Number is required';
    }
    if (empty($_POST['email'])) {
        $emptyFields[] = 'email';
        $error['email'] = 'email is required';
    }
    if (empty($_FILES["file"]["name"])) {
        $emptyFields[] = 'File';
        $error['file']["name"] = 'ID Picture is required';
    }
    // If any field is empty, return error message
    if (!empty($emptyFields)) {
        $response['success'] = false;
        $response['message'] = 'Incomplete form data. Empty fields: ' . implode(', ', $emptyFields);
    } else {
        // All fields are filled, proceed with form submission
        // Retrieve form data
        $username = $_POST['username'];
        $password = $_POST['password'];
        $birthdate = $_POST['Birthday'];
        $age = $_POST['age'];
        $sex = $_POST['sex'];
        $homeAddress = $_POST['homeAddress'];
        $phoneno = $_POST['phoneno'];
        $email = $_POST['email'];


        // Handle file upload
        $file = $_FILES["file"];
        $fileName = $file["name"];
        $fileTmpName = $file["tmp_name"];
        $fileSize = $file["size"];
        $fileError = $file["error"];

        // Check for file upload errors
        if ($fileError !== UPLOAD_ERR_OK) {
            $response['success'] = false;
            $response['message'] = 'File upload failed with error code: ' . $fileError;
        } else {
            // Check file type
            $fileType = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
            if (!in_array($fileType, array('jpg', 'jpeg', 'png'))) {
                $response['success'] = false;
                $response['message'] = 'Only JPG, JPEG, and PNG files are allowed.';
            } else {
                // Define the folder path where images are stored
                $folderPath = "../id_images/";

                // Generate a unique filename
                $fileName = uniqid() . "_" . basename($fileName);

                // Define the full path to save the file
                $filePath = $folderPath . $fileName;

                // Save the file to the specified folder
                if (move_uploaded_file($fileTmpName, $filePath)) {
                    // Now, insert the form data into the database
                    $sql = "INSERT INTO tblaccounts (username, password, birthdate, age, sex, home_address, phone_no, email, id_image, position)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'recruiter')";

                    $stmt = mysqli_prepare($conn, $sql);
                    mysqli_stmt_bind_param($stmt, "sssissssss", $username, $password, $birthdate, $age, $sex, $homeAddress, $phoneno, $email, $filePath);

                    if (mysqli_stmt_execute($stmt)) {
                    $response['success'] = true;
                    $response['message'] = 'Data Successfully Saved!';
                    } else {
                    $response['success'] = false;
                    $response['message'] = 'Error inserting data into database: ' . mysqli_error($conn);
                    }
                    mysqli_stmt_close($stmt);
                } else {
                    $response['success'] = false;
                    $response['message'] = 'Error moving uploaded file to destination folder.';
                }
            }
        }
    }
} else {
    $response['success'] = false;
    $response['message'] = 'Invalid request method.';
}

// Merge error and response arrays
$result = array_merge($error, $response);

// Return JSON response
echo json_encode($result);
?>
