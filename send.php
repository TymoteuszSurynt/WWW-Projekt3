<?php
require_once(__DIR__ . "/Database.php");
    if(isset($_POST['nickname']) && isset($_POST['semester']) && isset($_POST['comment']) && isset($_POST['page']) && isset($_POST['captcha']) && isset($_POST['captchaNumber'])){
        $nick=$_POST['nickname'];
        $sem=$_POST['semester'];
        $com=$_POST['comment'];
        $capcha=$_POST['captcha'];
        $capnum=$_POST['captchaNumber'];
        if(!empty($nick)&&!empty($sem)&&!empty($com)&&!empty($capcha)&&!empty($capnum)) {
            if (!($stmt4 = $mysqli->prepare("SELECT captcha.answear FROM captcha WHERE id LIKE ".$capnum))) {
                header("Location: ".$_POST['page']."&fail");
            }
            if (!$stmt4->execute()) {
                header("Location: ".$_POST['page']."&fail");
            }
            if (!($res4 = $stmt4->get_result())) {
                header("Location: ".$_POST['page']."&fail");
            }
            if($result4 = $res4->fetch_assoc()) {
                if (!strcmp($result4['answear'], $capcha)) {
                    if (!($stmt = $mysqli->prepare("CALL addComment(\"" . $nick . "\",\"" . $com . "\"," . $sem . ")"))) {
                        header("Location: ".$_POST['page']."&fail");
                    }
                    if (!$stmt->execute()) {
                        header("Location: ".$_POST['page']."&fail");
                    }else{
                        header("Location: ".$_POST['page']."&success");
                    }
                }else{
                    header("Location: ".$_POST['page']."&fail=2");
                }
            }else{
                header("Location: ".$_POST['page']."&fail=1");
            }
        }else{
            header("Location: ".$_POST['page']."&fail=1");
        }
    }else{
        header("Location: ".$_POST['page']."&fail=1");
    }
?>