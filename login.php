<?php
include('includes/config.php'); // Replace with the name of your DB file
session_start();

if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($con, $_POST['username']);
    $password = mysqli_real_escape_string($con, $_POST['password']);

    $query = "SELECT * FROM users WHERE username='$username'";
    $result = mysqli_query($con, $query);
    $user = mysqli_fetch_assoc($result);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['username'] = $user['username'];
        $_SESSION['id']=$user['id'];
        header('Location: home.php'); // Redirect to home.php on successful login
        exit();
    } else {
        echo "Invalid username or password.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form method="post" action="">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>
        <label>Password:</label>
        <input type="password" name="password" required><br><br>
        <input type="submit" name="login" value="Login">
    </form>
</body>
</html>
