-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: www_database
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `captcha`
--

DROP TABLE IF EXISTS `captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(100) NOT NULL,
  `answear` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `captcha_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha`
--

LOCK TABLES `captcha` WRITE;
/*!40000 ALTER TABLE `captcha` DISABLE KEYS */;
INSERT INTO `captcha` VALUES (1,'\\int^{+\\infty}_{-\\infty}?^{-x^2}dx=\\sqrt{\\pi}','e'),(2,'\\int^{+\\infty}_{-\\infty}e^{-?^2}dx=\\sqrt{\\pi}','x'),(3,'\\int^{+\\infty}_{-\\infty}e^{-x^2}dx=\\sqrt{?}','pi'),(4,'\\int^{+\\infty}_{-\\infty}e^{-x^2}??=\\sqrt{\\pi}','dx'),(5,'\\int^{+\\infty}_{-\\infty}e^{-x^?}dx=\\sqrt{\\pi}','2'),(6,'\\int^{+\\infty}_{-\\infty}e^{?x^2}dx=\\sqrt{\\pi}','-');
/*!40000 ALTER TABLE `captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(250) NOT NULL,
  `id_semester` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `comments_semesters_id_fk` (`id_semester`),
  CONSTRAINT `comments_semesters_id_fk` FOREIGN KEY (`id_semester`) REFERENCES `semesters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Abc','2018-06-09 20:33:28','Test tex:\r\n$$\\frac{1}{2}a^2$$',1),(3,'NewUser','2018-06-09 21:31:44','Abc',1),(4,'qqqq','2018-06-09 21:50:34','sdasdasdad',1),(5,'Nowy','2018-06-09 21:55:43','Komentarz',2),(6,'wewqe','2018-06-09 21:56:47','qweqweq',1),(7,'www','2018-06-09 21:58:10','wwww',2),(8,'wewqe','2018-06-09 22:04:58','aaaaaa',19),(9,'aaaa','2018-06-10 21:38:16','qqqq',17),(10,'aaaa','2018-06-10 21:39:43','11111',17);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(100) NOT NULL,
  `link` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Menu_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Semestr I','semester.php?semesterNumber=1&semesterName=Semestr%20I'),(2,'Semestr II','semester.php?semesterNumber=2&semesterName=Semestr%20II'),(3,'Semestr III','semester.php?semesterNumber=3&semesterName=Semestr%20III'),(4,'Semestr IV','semester.php?semesterNumber=4&semesterName=Semestr%20IV'),(5,'Semestr V','semester.php?semesterNumber=5&semesterName=Semestr%20V');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sem_num` int(11) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL,
  `link` varchar(50) DEFAULT NULL,
  `1_title` varchar(100) NOT NULL DEFAULT 'Czego się dowiedziałem',
  `1_card` varchar(500) NOT NULL,
  `1_ol` tinyint(1) NOT NULL DEFAULT '0',
  `1_bonus` varchar(250) DEFAULT NULL,
  `2_title` varchar(100) NOT NULL DEFAULT 'Czego warto się douczyć',
  `2_card` varchar(500) DEFAULT NULL,
  `2_ol` tinyint(1) NOT NULL DEFAULT '0',
  `2_bonus` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `semesters_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,1,'Analiza Matematyczna I','http://ki.pwr.edu.pl/programs/1-2015/opis1.pdf','Czego się dowiedziałem','W jaki sposób liczyć pochodne;W jaki sposób liczyć całki;W jaki sposób wyznaczać granice ciągów',1,'Wzór: $$ (a^x)\' = ln(a)a^x $$','Czego warto się douczyć','Zapamiętać wszystkie poznane wzory na pamięć',0,NULL),(2,1,'Algebra z Geometrią Analityczną','http://ki.pwr.edu.pl/programs/1-2015/opis2.pdf','Czego się dowiedziałem','Poznałem pojęcie i przykłady grup;pierscieni i ciał;Twierdzenie Kroneckera-Capellego;Poznałem pojęcie macierzy przekształcenia liniowego;jego obrazu i jądra oraz wartosci własnych i wektorów własnych;Poznałem kryterium Sylvestera dla form kwadratowych',1,'Wzór: $$\\frac{(a+bi)}{(c+di)}= \\frac{ac+bd}{c^2+d^2}+\\frac{bc-ad}{c^2+d^2}i$$','Czego warto się douczyć','Przypomnieć sobie pojęcie sumy prostej ortogonalnej podprzestrzeni liniowej i jej dopełnienia ortogonalnego w przestrzeni euklidesowej',0,NULL),(3,1,'Logika i Struktury Formalne','http://ki.pwr.edu.pl/programs/1-2015/opis3.pdf','Czego się dowiedziałem','Jak stworzyć tabelkę prawdy;Jak stosować kwantyfikatory;Jak stosować zasadę indukcji matematycznej;Obliczać moc zbiorów;Poznałem różnice między nieskończonościami',1,'Wzór: $$\\neg (p \\land q) = (\\neg p \\vee \\neg q)$$','Czego warto się douczyć','Przypomnieć sobie porządki',0,NULL),(4,1,'Wstęp do Informatyki i Programowania','http://ki.pwr.edu.pl/programs/1-2015/opis4.pdf','Czego się dowiedziałem','Podstawy C;Podstawowe algorytmy',1,NULL,'Czego warto się douczyć','C jest pełne niespodzianek',0,NULL),(5,2,'Analiza Matematyczna II','http://ki.pwr.edu.pl/programs/1-2015/opis5.pdf','Czego się dowiedziałem','W jaki sposób liczyć całki wielokrotne;W jaki sposób różniczkować funkcje wielu zmiennych;Przestrzenie metryczne',1,'Wzór: $$R=\\frac{1}{lim sup_n \\sqrt[n]{|a_n|}}$$','Czego warto się douczyć','Aby zawsze brać zajęcia z dr. Kapelko jeśli to możliwe',0,NULL),(6,2,'Algebra Abstrakcyjna i Kodowanie','http://ki.pwr.edu.pl/programs/1-2015/opis6.pdf','Czego się dowiedziałem','Poznałem podstawy teorii grup;Poznałem kody korekcyjne',1,'Wzór: $$a^{\\varphi(m)} \\equiv 1 \\pmod{m}$$','Czego warto się douczyć','Sprawdzanie czy dany zbiór jest podciałem',0,NULL),(7,2,'Matematyka Dyskretna','http://ki.pwr.edu.pl/programs/1-2015/opis7.pdf','Czego się dowiedziałem','Poznałem pojęcie symbolu Newtona;Poznałem pojęcie liczb Stirlinga;Poznałem własności permutacji;Poznałem pojęcie Grafu',1,'Wzór: $${n\\choose k}=\\frac{n!}{k!(n-k)!}$$','Czego warto się douczyć','Czego warto się douczyć;Przypomnieć sobie klasy drzew',0,NULL),(8,2,'Fizyka','http://ki.pwr.edu.pl/programs/1-2015/opis9.pdf','Czego się dowiedziałem','Powtórka informacji zdobytych w szkole średniej',0,'Wzór: $$E=mc^2$$','Czego warto się douczyć','Fizyki kwantowej',0,NULL),(9,2,'Kurs Programowania','http://ki.pwr.edu.pl/programs/1-2015/opis8.pdf','Czego się dowiedziałem','Podstawy C++ i Javy;Podstawy programowania objektowego',1,NULL,'Czego warto się douczyć','Wskaźników w C++',0,NULL),(10,2,'Problemy Prawne Informatyki','http://ki.pwr.edu.pl/programs/1-2015/opis10.pdf','Czego się dowiedziałem','Jak sprzeczne jest polskie prawo;W jaki sposób stworzyć dobrą umowę czy licencję',1,NULL,'Czego warto się douczyć','Zasad RODO',0,NULL),(11,2,'Język Angielski','http://www.sjo.pwr.edu.pl/index.dhtml','Czego się dowiedziałem','Nowych słów w języku angielskim;Zwrotów związanych z pracą inżyniera',1,NULL,'Czego warto się douczyć','Informacji potrzebych do zdania egzaminu na certyfikat',0,NULL),(12,3,'Metody Probabilistyczne i Statystyka','http://ki.pwr.edu.pl/programs/1-2015/opis11.pdf','Czego się dowiedziałem','Co to jest zmienna probabilistyczna;W jaki sposób liczyć oczekiwaną wartość;Poznałem podstawy statystyki',1,'Wzór: $$Pr(A)=\\frac{|A|}{|\\Omega|}$$','Czego warto się douczyć','Warto douczyć się szerszego zastosowania zmiennych probabilistycznych',0,NULL),(13,3,'Technologia Programowania','http://ki.pwr.edu.pl/programs/1-2015/opis12.pdf','Czego się dowiedziałem','Poznałem wzorce programistyczne;Poznałem tajniki Javy;Poznałem framework Play',1,NULL,'Czego warto się douczyć','Poznać więcej wzorców programistycznych',0,NULL),(14,3,'Bazy Danych i Zarządzanie Informacją','http://ki.pwr.edu.pl/programs/1-2015/opis13.pdf','Czego się dowiedziałem','Jak normalizować relację;Poznałem SQL oraz MySQL',1,NULL,'Czego warto się douczyć','Poznać zasady baz danych NoSQL',0,NULL),(15,3,'Architektura Komputerów i Systemy Operacyjne','http://ki.pwr.edu.pl/programs/1-2015/opis14.pdf','Czego się dowiedziałem','Jak działają różne protokoły, np. FTP;W jaki sposób działa procesor;W jaki sposób poprawnie pisać kod pod dany procesor;Podstawy assemblera x86 i ARM',0,NULL,'Czego warto się douczyć','Dodatkowych informacji związanych z językami niskopoziomowymis',0,NULL),(16,4,'Przedmioty humanistyczne','#','Czego się dowiedziałem','Na tych przedniotach obecność nie była obowiązkowa...',0,NULL,'Czego warto się douczyć','Jak zmusić się do chodzenia na nieobowizkowe zajęcia',0,NULL),(17,4,'Języki i Paradygmaty Programowania','http://ki.pwr.edu.pl/programs/1-2015/opis47.pdf','Czego się dowiedziałem','newol;Poznałem podstawy języków:;OZ;Prolog;Erlang;Scheme;closeol',1,NULL,'Czego warto się douczyć','Więcej zastosowań poznanych języków',0,NULL),(18,4,'Wprowadzenie do Teorii Grafów','http://ki.pwr.edu.pl/programs/1-2015/opis28.pdf','Czego się dowiedziałem','Podstawowe twierdzenia i definicje związane z teorią grafów',0,NULL,'Czego warto się douczyć','Dodatkowych informacji związanych z grafami',0,NULL),(19,4,'Algorytmy Metaheurystyczne','http://ki.pwr.edu.pl/programs/1-2015/opis96.pdf','Czego się dowiedziałem','Jak korzystać z SVN dr. Kika;W jakis sposób tworzyć plik make;Jak używać algorytmów metaheurystycznych w TSP',1,NULL,'Czego warto się douczyć','Poznanie większej ilości algorytmów metaheurystycznych',0,NULL),(20,4,'Algorytmy i Struktury Danych','http://ki.pwr.edu.pl/programs/1-2015/opis15.pdf','Czego się dowiedziałem','Poznałem zaawansowane algorytmy;Zgłębiłem programowanie w C/C++;Jak w dobie internetu nieskuteczne jest uczenie się algorytmów na pamięć',1,'Wzór: $$\\forall_n \\leqslant n_0 : f(n) \\leqslant c* g(n)$$','Czego warto się douczyć','Warto douczyć się szerszego zastosowania poznanych algorytmów',0,NULL),(21,4,'Technologie Sieciowe','http://ki.pwr.edu.pl/programs/1-2015/opis16.pdf','Czego się dowiedziałem','Poznałem sposoby tworzenia sprawozdań w aplikacji Word;Poznałem sposób działania współczesnych sieci;Poznałem sposób przepisywania się między grupami po zakończeniu zapisów',1,NULL,'Czego warto się douczyć','Jak przepisywać się do inncyh grup zajęciowych poza terminami zapisów ze 100% prawdopodobieństwem sukcesu',0,NULL),(22,5,'Obliczenia Naukowe','http://ki.pwr.edu.pl/programs/1-2015/opis18.pdf','Czego się dowiedziałem','Jak poprawnie pisać sprawzdania;Jak korzystać z programu Latex;Co to standard IEE754 i interpolacja',1,'Wzór: $$T_k(x)=2x*T_{k-1}(x)-T_{k-2}(x)$$','Czego warto się douczyć','W jaki sposób sporządzać lepsze pliki .tex',0,NULL),(23,5,'Języki Formalne i Techniki Translacji','http://ki.pwr.edu.pl/programs/1-2015/opis19.pdf','Czego się dowiedziałem','Poznałem Lemat o Popmowaniu i jego różne warianty;Nauczyłem się zasad pisania kompilatora;Napisałem kompilator',1,NULL,'Czego warto się douczyć','Może warto zastosować LOP więcej niż raz w życiu, na egzaminie',0,NULL),(24,5,'Programowanie Zespołowe','http://ki.pwr.edu.pl/programs/1-2015/opis20.pdf','Czego się dowiedziałem','Jak pracować w grupie większej niż 2 osoby;Dlaczego nie stosować frameworków w wersji alfa, szczególnie react-native',1,NULL,'Czego warto się douczyć','Jak pracować w grupie większej niż trzy osoby i się nie zablić',0,NULL),(25,5,'Kryptografia','http://ki.pwr.edu.pl/programs/1-2015/opis103.pdf','Czego się dowiedziałem','Poznałem podstawy nowoczesnej kryptografii;Poznałem w jaki sposób działają podpisy RSA;Poznałem jak działają szyfry blokowe oraz co to są liczby pseudolosowe',1,NULL,'Czego warto się douczyć','Warto się nauczyć, żeby domagać się klarownych zasad zaliczenia zaraz na początku kursu',0,NULL),(26,5,'Bezpieczeństwo','http://ki.pwr.edu.pl/programs/1-2015/opis45.pdf','Czego się dowiedziałem','Poznałem PHP;Poznałem zastosowanie algorytmów z kryptografii w rzeczywistych sytuacjach;Poznałem w jaki sposób weryfikować bezpieczeństwo swojego portalu',1,NULL,'Czego warto się douczyć','Poszerzyć informacje w nowoczesnych technologiach',0,NULL),(27,5,'Metody Wytwarzania Oprogramowania','http://ki.pwr.edu.pl/programs/1-2015/opis98.pdf','Czego się dowiedziałem','Przedmiot bardzo podobny do programowania zespołowego',0,NULL,'Czego warto się douczyć','Tego samego co w programowaniu zespołowym',0,NULL);
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-14  9:36:40
