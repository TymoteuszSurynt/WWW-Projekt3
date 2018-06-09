<?php
require_once(__DIR__ . "/MyPage.php");
require_once(__DIR__ . "/MySemester.php");
require_once(__DIR__ . "/Database.php");
$P = new MySemester("Semestr I", "Tymoteusz Surynt");
$P->setDescription("Moja przygoda z edukacją");
if (!($stmt = $mysqli->prepare("SELECT id,title,link,1_title,1_card,1_ol,1_bonus,2_title,2_card,2_ol,2_bonus FROM semesters WHERE sem_num LIKE 1"))) {
    die ();
}
if (!$stmt->execute()) {
    die ();
}
if (!($res = $stmt->get_result())) {
    die();
}
echo $P->begin();
?>
    <head>
        <?php
        echo $P->getHeader();
        ?>
    </head>
<?php

    $s= $P->startBody(false);
    if (!($stmt2 = $mysqli->prepare("SELECT menu.option,menu.link FROM menu"))) {
        die ();
    }
    if (!$stmt2->execute()) {
        die ();
    }
    if (!($res2 = $stmt2->get_result())) {
        die();
    }
    $options=array();
    $links=array();
    while ($result2 = $res2->fetch_assoc()){
        array_push($options,$result2['option']);
        array_push($links,$result2['link']);
    }
    $s.= $P->getMenu($options,$links);
    $s.= $P->startContent();
    $s.= $P->getPanel();
    $s.= $P->getHeaderSection(true,"Semestr I");
    $s.= $P->startRow();
    $select=array();
    while ($result = $res->fetch_assoc()){
        $s.= $P->startArticle($result["link"],$result["title"]);
        $c1=explode(";",$result["1_card"]);
        if(sizeof($c1)<2){
            $c1=$result["1_card"];
        }
        $c2=explode(";",$result["2_card"]);
        if(sizeof($c2)<2){
            $c2=$result["2_card"];
        }
        $s.=$P->getCard($result["1_title"],$c1,$result["1_ol"],$result["1_bonus"]);
        $s.=$P->getCard($result["2_title"],$c2,$result["2_ol"],$result["2_bonus"]);
        $s.=$P->stopArticle();
        if (!($stmt3 = $mysqli->prepare("SELECT nickname,comments.date,comment FROM comments WHERE id_semester LIKE ".$result['id']))) {
            die ();
        }
        if (!$stmt3->execute()) {
            die ();
        }
        if (!($res3 = $stmt3->get_result())) {
            die();
        }
        $comments=array();
        while ($result3 = $res3->fetch_assoc()) {
            array_push($comments,[$result3['nickname'],$result3['comment'],$result3['date']]);
        }
        $s.=$P->commentSection($comments);
        array_push($select,[$result['title'],$result['id']]);
    }
    $s.=$P->addComments($select,"send.php","sem1.php");
    $s.=$P->stopDiv(3);
    $s.=$P->getFooter("Projekt III - Nowoczesne Technologie WWW");
    $s.=$P->end();
    echo $s;
?>