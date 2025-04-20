<?php
session_start(); // Start session at the top of the file
include("init.php"); // Include the database connection

// Check if login form is submitted
if (isset($_POST["userid"], $_POST["password"])) {
    $username = $_POST["userid"];
    $password = $_POST["password"];
    
    // Query to check if the username and password are correct
    $sql = "SELECT userid, password FROM admin_login WHERE userid = '$username'";
    $result = mysqli_query($conn, $sql);
    $count = mysqli_num_rows($result);
    
    if ($count == 1) {
        // Fetch the password hash from the database
        $row = mysqli_fetch_array($result);
        $hashed_password = $row['password'];

        // Check if the entered password matches the hashed password
        if (password_verify($password, $hashed_password)) {
            $_SESSION['login_user'] = $username; // Save username to session
            header("Location: dashboard.php"); // Redirect to dashboard
            exit(); // Exit after redirect to avoid further processing
        } else {
            echo '<script language="javascript">';
            echo 'alert("Invalid Username or Password")';
            echo '</script>';
        }
    } else {
        echo '<script language="javascript">';
        echo 'alert("Invalid Username or Password")';
        echo '</script>';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="./font-awesome-4.7.0/css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
</head>
<body>
    <div class="title">
        <span>Student Result Management System</span>
    </div>

    <div class="main">
        <div class="login">
            <form action="" method="post" name="login">
                <fieldset>
                    <legend class="heading">Admin Login</legend>
                    <input type="text" name="userid" placeholder="Email" autocomplete="off" required>
                    <input type="password" name="password" placeholder="Password" autocomplete="off" required>
                    <input type="submit" value="Login">
                </fieldset>
            </form>    
        </div>
        <div class="search">
            <form action="./student.php" method="get">
                <fieldset>
                    <legend class="heading">For Students</legend>

                    <?php
                        // Fetch available classes from the database
                        $class_result = mysqli_query($conn, "SELECT `name` FROM `class`");
                        echo '<select name="class">';
                        echo '<option selected disabled>Select Class</option>';
                        while ($row = mysqli_fetch_array($class_result)) {
                            $display = $row['name'];
                            echo '<option value="'.$display.'">'.$display.'</option>';
                        }
                        echo '</select>';
                    ?>

                    <input type="text" name="rn" placeholder="Roll No">
                    <input type="submit" value="Get Result">
                </fieldset>
            </form>
        </div>
    </div>

</body>
</html>