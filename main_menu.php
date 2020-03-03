<?php 
session_start();

echo '<html>';
echo '<head>';
echo '<title>bioGMCS</title>';
echo '<link rel="stylesheet" href="my_styles.css">	';	
echo '</head>';
echo '<body>';


//echo '<pre>';
//print_r($GLOBALS);
//echo '</pre>';

if(isset($_POST['login']))
{
$_SESSION['login']=$_POST['login'];
}

if(isset($_POST['password']))
{
$_SESSION['password']=$_POST['password'];
}

include 'common.php';

if(!start_nchsls())
{
exit();
}

$remote_user=array(
'Dr.Shailesh',
'Dr.Saritamam',
'Dr.Sarita',
'Dr.Piyush',
'Dr.Shilpi',
'Dr.Niral',
'Dr.Chapal',
'Dr.Nikunj',
'Dr.Chinka',
'doctor'
);

if($_SERVER['REMOTE_ADDR']=='12.207.3.241')
{
	if(!in_array($_SESSION['login'],$remote_user))
	{
		echo 'You are not authorized to access outside LAN';
		exit(0);
	}
}


if($_SESSION['login']=='doctor')
{
	echo '<div id=doctor_menu>';
	echo '<a id=doctor_item1 class=dmi href=print_report_pdf_A4_ri_last_doctor.php>Biochemistry Report</a>';
	echo '<a id=doctor_item2 class=dmi href=logout.php>Logout</a>';
	echo '<a id=doctor_item3 class=dmi href=doctor_help.html target=_blank>HELP</a>';
	echo '</div>';
}
else
{
	main_menu();
}

?>
