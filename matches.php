<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matches</title>
    <link rel="stylesheet" href="styles.css"> <!-- Include your stylesheet -->
</head>
<body>
    <h1>Your Matches</h1>
    <p>This is where you can see your matches.</p>
    
    <!-- Your PHP code to fetch and display matches from the database would go here -->
    
    <?php
    // Example PHP code to fetch matches from the database
    // Replace this with your actual database querying code
    
    // Connect to your database
    $servername = "localhost";
    $username = "username";
    $password = "password";
    $dbname = "your_database_name";
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    // SQL query to fetch matches
    $sql = "SELECT * FROM matches WHERE user_id = ?"; // Replace 'matches' with your actual table name
    
    // Prepare and bind the SQL statement
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id); // Replace 'i' with the data type of your user_id
    
    // Set the user_id parameter
    $user_id = $_SESSION['user_id']; // Assuming you have stored the user ID in a session variable
    
    // Execute the prepared statement
    $stmt->execute();
    
    // Get the result
    $result = $stmt->get_result();
    
    // Check if there are any matches
    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "Match ID: " . $row["match_id"] . "<br>";
            // Output other details of the match as needed
        }
    } else {
        echo "No matches found.";
    }
    
    // Close the prepared statement and database connection
    $stmt->close();
    $conn->close();
    ?>
    
</body>
</html>
