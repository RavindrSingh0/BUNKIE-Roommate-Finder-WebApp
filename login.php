<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "roommate_finder";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle login form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $registration_no = $_POST['registration_no'];
    $dob = $_POST['dob'];

    // Check if user exists in the database
    $sql = "SELECT * FROM users WHERE registration_no = '$registration_no' AND dob = '$dob'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User authenticated, redirect to the Matches page
        header('Location: matches.php');
        exit;
    } else {
        // User not found, handle authentication failure
        echo "Invalid credentials";
    }
}

$conn->close();
?>
