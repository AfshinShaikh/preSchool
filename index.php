<?php
include('includes/config.php'); // Replace with the name of your DB file

if (isset($_POST['signup'])) {
    $username = mysqli_real_escape_string($con, $_POST['username']);
    $password = mysqli_real_escape_string($con, $_POST['password']);
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    $query = "INSERT INTO users (username, password) VALUES ('$username', '$hashedPassword')";
    if (mysqli_query($con, $query)) {
        echo "Registration successful! You can now <a href='login.php'>login</a>.";
    } else {
        echo "Error: " . mysqli_error($con);
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h2>Sign Up</h2>
    <form method="post" action="">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>
        <label>Password:</label>
        <input type="password" name="password" required><br><br>
        <input type="submit" name="signup" value="Sign Up">
    </form>
</body>
</html>
