<?php
require_once(__DIR__ . "/MyPage.php");
require_once(__DIR__ . "/Database.php");
$P = new MyPage("Moje przygody z edukacją", "Tymoteusz Surynt");
$P->setDescription("Moja przygoda z edukacją");
echo $P->begin();
?>
    <head>
        <?php
        echo $P->getHeader();
        ?>
    </head>
<?php
$s = $P->startBody();
if (!($stmt2 = $mysqli->prepare("SELECT menu.option,menu.link FROM menu"))) {
    die ();
}
if (!$stmt2->execute()) {
    die ();
}
if (!($res2 = $stmt2->get_result())) {
    die();
}
$options = array();
$links = array();
while ($result2 = $res2->fetch_assoc()) {
    array_push($options, $result2['option']);
    array_push($links, $result2['link']);
}
$s .= $P->getMenu($options, $links);
$s .= $P->startContent();
$s .= $P->getPanel();
$s .= $P->getHeaderSection();
$s .= $P->startRow();
$s .= $P->getSection("Jestem studentem 3 roku Politechniki Wrocławkiej, wydziału Podstawowoych Problemów Techniki,
                    kierunku Informatyka. Oprócz zmagań związanych z zaliczaniem kolejnych przedmiotów jestem również
                    starostą mojego roku. Poniższa strona jest poświęcona moim postępom w edukacji oraz kolejnym
                    przedmiotom z którymi zmagałem się dotychczas podczas studiów.",'avatar');
$s .= $P->startFlex();
$s .= $P->getCard("Moja Edukacja", ["<a href='http://www.lo3.opole.pl/index2.php'>Szkoła średnia</a>",
    "<a href=\"semester.php?semesterNumber=1&semesterName=Semestr%20I\">Semestr I</a>",
    "<a href=\"semester.php?semesterNumber=2&semesterName=Semestr%20II\">Semestr II</a>",
    "<a href=\"semester.php?semesterNumber=3&semesterName=Semestr%20III\">Semestr III</a>",
    "<a href=\"semester.php?semesterNumber=4&semesterName=Semestr%20IV\">Semestr IV</a>",
    "<a href=\"semester.php?semesterNumber=5&semesterName=Semestr%20V\">Semestr V</a>"], true);
$s .= $P->getCard("Moje Hobby", ["Literatura Lovecrafta",
    "newul",
    "Gry",
    "Dark Sous III",
    "GO",
    "Poker", "closeul"], true, "<p><a href=\"hobby.php\">Więcej informacji o moich hobby</a></p>");
$s .= $P->stopDiv(5);
$s .= $P->getFooter("Projekt I - Nowoczesne Technologie WWW");
$s .= $P->end();
echo $s;
?>