<?php

// Function to validate form data
function validateAndInsert($conn, $post, $files) {
    $response = array();
    $error = array();

    // Check each required field individually
    $requiredFields = array(
        'username' => 'Username',
        'password' => 'Password',
        'Birthday' => 'Birthday',
        'age' => 'Age',
        'sex' => 'Sex',
        'homeAddress' => 'Home Address',
        'phoneno' => 'Phone Number',
        'file' => 'ID Picture'
    );

    foreach ($requiredFields as $key => $value) {
        if (empty($post[$key])) {
            $error[$key] = $value . ' is required';
        }
    }

    // Check file upload
    if (empty($files["file"]["name"])) {
        $error['file'] = 'ID Picture is required';
    } else {
        $fileType = strtolower(pathinfo($files["file"]["name"], PATHINFO_EXTENSION));
        if (!in_array($fileType, array('jpg', 'jpeg', 'png'))) {
            $error['file'] = 'Only JPG, JPEG, and PNG files are allowed.';
        }
    }

    // If there are validation errors, return error message
    if (!empty($error)) {
        $response['success'] = false;
        $response['errors'] = $error;
    } else {
        // All fields are valid, proceed with insertion
        // Retrieve form data
        $username = $post['username'];
        $password = $post['password'];
        $birthdate = $post['Birthday'];
        $age = $post['age'];
        $sex = $post['sex'];
        $homeAddress = $post['homeAddress'];
        $phoneno = $post['phoneno'];

        // Handle file upload
        $file = $files["file"];
        $fileName = $file["name"];
        $fileTmpName = $file["tmp_name"];

        // Define the folder path where images are stored
        $folderPath = "../id_images/";

        // Generate a unique filename
        $fileName = uniqid() . "_" . basename($fileName);

        // Define the full path to save the file
        $filePath = $folderPath . $fileName;

        // Save the file to the specified folder
        if (move_uploaded_file($fileTmpName, $filePath)) {
            // Now, insert the form data into the database
            $sql = "INSERT INTO tblrecruiter (username, password, birthdate, age, sex, home_address, phone_no, id_image)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "sssissss", $username, $password, $birthdate, $age, $sex, $homeAddress, $phoneno, $filePath);

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

    return $response;
}

?>
