<?php
require_once(__DIR__ . "/Database.php");
    if(isset($_POST['nickname']) && isset($_POST['semester']) && isset($_POST['comment']) && $_POST['page']){
        $nick=$_POST['nickname'];
        $sem=$_POST['semester'];
        $com=$_POST['comment'];
        if (!($stmt = $mysqli->prepare("CALL addComment(\"".$nick."\",\"".$com."\",".$sem.")"))) {
            die ();
        }
        if (!$stmt->execute()) {
            die ();
        }
        header("Location: ".$_POST['page']);
    }
?>