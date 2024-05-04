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

// Handle signup form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $registration_no = $_POST['registration_no'];
    $email = $_POST['email'];
    $outlook_id = $_POST['outlook_id'];
    $mob_no = $_POST['mob_no'];
    $dob = $_POST['dob'];
    $course = $_POST['course'];
    $branch = $_POST['branch'];
    $year = $_POST['year'];
    $smoking = isset($_POST['smoking']) ? 1 : 0;
    $alcoholic = isset($_POST['alcoholic']) ? 1 : 0;
    $nightowl = $_POST['nightowl'];
    $physically_active = $_POST['physically_active'];

    // Insert data into the database
    $sql = "INSERT INTO users (name, registration_no, email, outlook_id, mob_no, dob, course, branch, year)
            VALUES ('$name', '$registration_no', '$email', '$outlook_id', '$mob_no', '$dob', '$course', '$branch', '$year')";
    
    if ($conn->query($sql) === TRUE) {
        // Signup successful, redirect to the Matches page
        header('Location: matches.php');
        exit;
    } else {
        // Error handling
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
