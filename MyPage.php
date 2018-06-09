<?php

class MyPage
{
    private $title = "";
    private $description = "";
    private $author = "";

    function __construct($title = "", $author = "")
    {
        $this->title = $title;
        $this->author = $author;
    }

    public function getTitle()
    {
        return $this->title;
    }

    public function begin()
    {
        $s = "<!DOCTYPE html>
        <html lang='pl'>";
        return $s;
    }

    public function end()
    {
        $s = "</body></html>";
        return $s;
    }

    public function getMenu($tabs,$links)
    {
        $s="";
        $size=count($links);
        if($size==count($tabs)) {
            $s = "<nav class=\"nav-fixed\">
        <a class=\"nav-button button-left\" href=\"index.php\">
            home
        </a>
        <div class=\"hidden-on-small-screen\">";
        for($i=0; $i<$size; $i++){
            $s.="<a class=\"nav-button button-right\" href=\"".$links[$i]."\">
            ".$tabs[$i]."
        </a>";
            }
        $s.= " </div >

        <div class=\"dropdown button-right\">
            <button class=\"nav-button dropdown-button\"><img src=\"img/menu.png\" alt=\"menu\">
            </button>
            <div class=\"dropdown-content\">";
        for($i=0;$i<$size;$i++){
            $s.="<a href=\"".$links[$i]."\">
                    ".$tabs[$i]."
                </a>";
        }

          $s.="
            </div>
        </div>

    </nav>
";
            }
            return $s;
    }

    public function getHeaderSection($h3=false,$h3Content="")
    {
        $s = "<header>
            <h1>
                " . $this->author . "
            </h1>
            <h2>
                " . $this->description . "
            </h2>";
        if($h3){
            $s.="<h3>".$h3Content."</h3>";
        }
        $s.="
        </header>";
        return $s;
    }

    public function setDescription($desc = "")
    {
        $this->description = $desc;
    }

    public function getFooter($content)
    {
        $s = "<footer>
            " . $content . "
        </footer>";
        return $s;
    }

    public function getHeader()
    {

        $s = "<meta charset=\"utf-8\">
        <title>" . $this->title . "</title>
        <meta name='description' content='" . $this->description . "'>
        <meta name='author' content='" . $this->author . "'>
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>
        <link rel=\"stylesheet\" href=\"css/reset.css\">
        <link rel=\"stylesheet\" href=\"css/nav.css\">
        <link rel=\"stylesheet\" href=\"css/grid.css\">
        <link rel=\"stylesheet\" href=\"css/main.css\">
        <script type=\"text/javascript\" async
          src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-MML-AM_CHTML\">
        </script>";
        return $s;
    }

    public function startFlex()
    {
        return "<div class=\"flex-box\">";
    }

    public function startRow()
    {
        return "<div class=\"row\">";
    }

    public function stopDiv($num=1)
    {
        $s ="";
        for($i=0;$i<$num;$i++){
            $s.="</div>";
        }
        return $s;
    }

    public function getCard($header, $arguments, $ol = false, $bonus = "")
    {
        $s = "<div class=\"col-12-12 col-sm-12-6\">
                    <div class=\"panel-border\">
                        <header>
                            <h3>" . $header . "</h3>
                        </header>
                        <section>";

        if (is_array($arguments)) {
            if ($ol) {
                $s .= "<ol>";
            } else {
                $s .= "<ul>";
            }

            $check = 0;
            foreach ($arguments as $item) {
                if ($check) {
                    $s .= $item;
                    if ($check == 1) {
                        $s .= "<ol>";
                    } else {
                        $s .= "<ul>";
                    }
                    $check = 0;
                } else if (!strcmp($item, "newol")) {
                    $s .= "<li>";
                    $check = 1;
                } else if (!strcmp($item, "newul")) {
                    $s .= "<li>";
                    $check = 2;
                } else if (!strcmp($item, "closeol")) {
                    $s .= "</ol>";
                    $s .= "</li>";
                } else if (!strcmp($item, "closeul")) {
                    $s .= "</ul>";
                    $s .= "</li>";
                } else {
                    $s .= "<li>" . $item . "</li>";
                }
            }
            if ($ol) {
                $s .= "</ol>";
            } else {
                $s .= "</ul>";
            }
        } else {
            $s .="<p>". $arguments."</p>";
        }
        $s .= $bonus;
        $s .= "
                        </section>
                    </div>
                </div>";
        return $s;
    }

    public function getSection($content)
    {
        return "<section>
                <p>" . $content . "</p>
            </section>";
    }

    public function getPanel()
    {
        return "<div
                class=\"panel col-12-12 offset-md-12-1 col-md-12-10 offset-lg-12-2 col-lg-12-8\">";
    }

    public function startContent()
    {
        return "<div class=\"container first-after-top main\">";
    }
    public function startBody($middle=true){
        if($middle){
            return "<body>
            <div class=\"middle\">";
        }else{
            return "<body>";
        }
    }
}

?>