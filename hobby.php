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
    $s.= $P->getHeaderSection(true,"Hobby");
    $s.= $P->startRow();
    $s.=$P ->startFlex();
    $s.=$P->getCard("Literatura Lovecrafta","Literatura horroru jest wspaniałą pozycją, umożliwiającą odpoczynek od zmagań z Politechniką oraz jej regulacjami.
                            Jeśli stos zasad i regulacji oraz setki ich interpretacji są nam nie straszne to z pewnością również nie przestraszy nas
                            najgorszy potwór Lovecrafta.");
    $s.= $P->getCard("Gra: Dark Souls III","Owa gra jest uważana za jedną z najtrudniejszych gier wydawanych w ostatnich latach. Przypomina zmagania ze studiami,
                            chociaż nie wiadomo jak się człowiek stara i tak znajdzie się jakaś osoba, która chętnie utrudni nam życie, bez większego zysku.");

    $s.= $P->stopDiv();
    $s.=$P->startFlex();
    $s.= $P->getCard("Gra GO","Znajomość tej gry była wymagana na zaliczenie jednego z przedmiotów, więc stała się symbolem jednego z semestrów na studiach.
");
    $s.=$P->getCard("Gra w Pokera","Ta gra nie dość, że pozwala zastosować dużo metod obliczania prawdopodbieństwa uczonych na jednym z przedmiotów to uczy najważniejszej umiejętności potrzebnej każdemu studentowi,
                                a mianowicie blefowania. Bez tej umiejętności zdanie studiów jest praktycznie nie możliwe, a na pewno nie zdanie niektórych przedmiotów za pierwszym razem.");
    $s.=$P->stopDiv(4);
    $s.=$P->getFooter("Projekt I - Nowoczesne Technologie WWW");
    $s.=$P->end();
    echo $s;
?>