<?php
session_start();

echo '<html>';
echo '<head>';
echo '<link rel="stylesheet" href="my_styles.css">	';	
echo '</head>';
echo '<body>';

//echo '<pre>';
//print_r($GLOBALS);
//echo '</pre>';


echo '
<form class=logingrid method=post action=main_menu.php>
<div 	class=message>Biochemistry NCHSLS NCH Surat</div>
<div 	class=lbl>Login Name</div>
<input  class=fld type=text name=login placeholder=WriteLoginName>
<div	class=lbl>Password</div>
<div><input 	class=fld type=password name=password placeholder=password></input></div>
<input class=submit_button type=submit name=action value=Login></input>
</form> ';

echo '</body></html>';
//echo $_SERVER['REMOTE_ADDR'];
?>
