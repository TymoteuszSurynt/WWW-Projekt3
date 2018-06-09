<?php
    $servername = "localhost";
    $usernamedb = "root";
    $passworddb = "1234";
    $db = "www_database";
    $mysqli = mysqli_connect($servername, $usernamedb, $passworddb, $db);
    unset($passworddb);
    if ($mysqli->connect_errno) {
        die ("Connection Error");
    }
?>