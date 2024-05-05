<?php
// Establish database connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "image_upload_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Define the folder path where images are stored
$folderPath = "uploads/";

// Check if the form is submitted and the file is uploaded
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["image"])) {
    // Check if there is no error in the uploaded file
    if ($_FILES["image"]["error"] == UPLOAD_ERR_OK) {
        // Get the file extension
        $fileExtension = strtolower(pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION));
        
        // Check if the file extension is allowed
        $allowedExtensions = array("jpg", "jpeg", "png");
        if (in_array($fileExtension, $allowedExtensions)) {
            // Retrieve file information
            $fileName = basename($_FILES["image"]["name"]);
            $filePath = $folderPath . $fileName;
            
            // Move the uploaded file to the specified folder
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $filePath)) {
                // Insert image information into the database
                $stmt = $conn->prepare("INSERT INTO uploaded_images (file_name, file_path) VALUES (?, ?)");
                $stmt->bind_param("ss", $fileName, $filePath);
                
                if ($stmt->execute()) {
                    echo '<div class="alert alert-success">Image uploaded and inserted into the database successfully.</div>';
                } else {
                    echo '<div class="alert alert-danger">Error: Unable to insert image into the database.</div>';
                }
                $stmt->close();
            } else {
                echo '<div class="alert alert-danger">Error: Unable to upload image.</div>';
            }
        } else {
            echo '<div class="alert alert-danger">Error: Only JPG, JPEG, and PNG files are allowed.</div>';
        }
    } else {
        echo '<div class="alert alert-danger">Error: ' . $_FILES["image"]["error"] . '</div>';
    }
} else {
    echo '<div class="alert alert-danger">Error: Invalid request.</div>';
}

// Close database connection
$conn->close();
?>
