<?php

function printIssue()
{
	$your_printer_name = "http://12.207.3.238/printers/Zebra_TLP2844";
	$handle=printer_open($your_printer_name);
	
$xx=printer_set_option ($handle , PRINTER_MODE, "raw")
//set the font characteristics here
//	$font_face = "Draft Condensed";
//	$font_height = 20;
//	$font_width = 6;
//$font=printer_create_font($font_face,$font_height,$font_width,PRINTER_FW_THIN,false,false,false,0);
//printer_select_font($handle,$font);

printer_write($handle,"My PDF file content below");
printer_delete_font($font);
printer_close($handle);
}

printIssue();

?>
