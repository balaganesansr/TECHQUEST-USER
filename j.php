<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");

$servername = "www.mzcet.in"; // Replace with your MySQL server address
$username = "mzcetin1_techquest22"; // Replace with your MySQL username
$password = "Possible@123"; // Replace with your MySQL password
$dbName = "mzcetin1_techquest22"; // Replace with your MySQL database name

// Create a new MySQLi instance
$mysqli = new mysqli($servername, $username, $password, $dbName);

// Check for connection errors
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

if (isset($_POST['id'])) {
    $id = intval($_POST['id']); // Cast to in
    // Set maximum attempts
    $maxAttempts = 3; // You can change this to your desired value
    
    // Initialize attempt counter
    $attempts = 0;
    
    while ($attempts < $maxAttempts) {
        // Check if the ID exists in the table
        $query = "SELECT id FROM R3_Performance WHERE id = ?";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $stmt->store_result();
        
        if ($stmt->num_rows > 0) {
            $query = "UPDATE R3_Performance SET status = 1 WHERE id = ?";
            $stmt = $mysqli->prepare($query);
            $newStatus = 1; // Assuming you want to set status to 1
            $stmt->bind_param("i", $id);
            
            if ($stmt->execute()) {
                echo "Status updated successfully for ID $id";
                break; // Exit the loop on success
            } else {
                echo "Error updating status: " . $stmt->error;
            }
        } else {
            echo "ID $id does not exist in the table.";
            break; // Exit the loop if ID doesn't exist
        }
        
        // Close the statement
        $stmt->close();
        
        // Increment the attempts counter
        $attempts++;
        $id++;
    }
    
    if ($attempts >= $maxAttempts) {
        echo "Maximum attempts reached for updating ID $id.";
    }
} else {
    echo "ID not provided in the POST request.";
}

// Close the MySQL connection
$mysqli->close();
?>
