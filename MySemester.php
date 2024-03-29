<?php

class MySemester extends MyPage
{
    public function startArticle($link, $title)
    {
        $s = "<article>
            <h2><a href=\"" . $link . "\">" . $title . "</a></h2>
            <div class=\"flex-box\">";
        return $s;
    }

    public function stopArticle()
    {
        $s = "</div></article>";
        return $s;
    }

    public function commentSection($comments=[])
    {
        $s = "<article class=\"col-12-12 offset-md-12-1 col-md-12-10 offset-lg-12-2 col-lg-12-8\">
        <div class=\"comment-head\">
            <h2>Komentarze:</h2>
        </div>
        <section class=\"comment-section\">";
        if(sizeof($comments)>0) {
            foreach ($comments as $comment) {
                $s .= "<div class=\"single-comment\">
                <p class=\"comment-date\">$comment[2]</p>
                <p>$comment[0]</p>
                <p class='comment-separator'>$comment[1]</p>
            </div>";
            }
        }else{
            $s.="<p class='no-comments'>Brak komentarzy</p>";
        }
        $s.="
        </section>
    </article>";
        return $s;
    }
    public function prompt($statement, $success){
        if($success){
            $s="<section class='success'><p>$statement</p></section>";
        }else{
            $s="<section class='error'><p>$statement</p></section>";
        }
        return $s;
    }
    public function addComments($options, $target, $location, $captcha){
        $s="<section class=\"col-12-12 offset-md-12-1 col-md-12-10 offset-lg-12-2 col-lg-12-8\">
        <form class=\"add-comment-body\" method=\"POST\" action=\"$target\" id=\"usrform\">
       
            <input type=\"text\" name=\"nickname\" placeholder=\"Pseudonim\" class=\"form-element\" style=\"float: left\">
            <select name=\"semester\" form=\"usrform\" class=\"form-select\">";
        foreach ($options as $option){
            $s.="<option value='$option[1]'>$option[0]</option>";
        }
        $s.="</select>
            <textarea name=\"comment\" form=\"usrform\" class=\"comment-area form-element\" placeholder=\"Komentarz\"></textarea>
            <div class='captcha-section'>
            <input name='page' type='hidden' value='$location'>
            <p>$$$captcha[1]$$</p>
            <input type=\"submit\" style='float:right' value='Wyślij'>
            Korzystając ze wzoru: ?=
            <input type='text' class='captcha' name='captcha'>
            <input type='hidden' name='captchaNumber' value='$captcha[0]'>
            </div>

        </form>
    </section>";
        return $s;
    }

}

?>