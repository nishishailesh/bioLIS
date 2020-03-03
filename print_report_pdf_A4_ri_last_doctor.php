<?php
session_start();
//echo '<pre>';print_r($_POST);
include 'common.php';

if(!login_varify())
{
	exit();
}

if(isset($_POST['submit']))
{
	if($_POST['submit']!='print_final')
	{
		echo '<link rel="stylesheet" href="my_styles.css">	';	
		echo '<div id=doctor_container>';
		doctor_menu();		
	}
}
else
{
	echo '<link rel="stylesheet" href="my_styles.css">	';	
	echo '<div id=doctor_container>';
	doctor_menu();		
}




$search_str='select sample_id from sample '; 
$where=array();

if(isset($_POST['submit']))
{
	foreach($_POST as $key=>$value)
	{
		if(substr($key,0,4)=='chk_' && $value=='on')
		{
			//echo substr($key,4).'='.$_POST[substr($key,4)].'<br>';
			$where[substr($key,4)]=$_POST[substr($key,4)];
		}
	}
}

//print_r($where);

$sample_id_where='';
if(isset($where['from_sample_id']) && isset($where['to_sample_id']) )
{
$sample_id_where='sample_id between  \''.$where['from_sample_id'].'\' and \''.$where['to_sample_id'].'\' ';
}
elseif(isset($where['from_sample_id']))
{
$sample_id_where=' sample_id=\''.$where['from_sample_id'].'\' ';
}
elseif(isset($where['to_sample_id']))
{
$sample_id_where=' sample_id=\''.$where['to_sample_id'].'\' ';
}

$other_wheree='';
foreach($where as $key=>$value)
{
	if($key!='from_sample_id' && $key!='to_sample_id' )
	{
		$other_wheree=$other_wheree.' '.$key.' like \''.$value.'\' and';
	}
}
$other_where=substr($other_wheree,0,-3);


if(strlen($sample_id_where)>0 && strlen($other_where)>0)
{
$search_str=$search_str.' where '.$sample_id_where.' and '.$other_where;
}
elseif(strlen($sample_id_where)>0 && strlen($other_where)==0)
{
$search_str=$search_str.' where '.$sample_id_where;
}
elseif(strlen($sample_id_where)==0 && strlen($other_where)>0)
{
$search_str=$search_str.' where '.$other_where;
}

$printed=array();
$not_printed=array();

$printed_str='';
$not_printed_str='';

if(isset($_POST['submit']) )
{
	$link=start_nchsls();
	if($_POST['submit']=='print' && substr($search_str,-7)!='sample ')
	{
		//echo $search_str;
		if(!$search_result=mysql_query($search_str,$link)){echo mysql_error();}
		while($ar=mysql_fetch_assoc($search_result))
		{
			if(in_array(get_sample_status($ar['sample_id']),$GLOBALS['final_stage']))
			{
				//$printed[]=$ar['sample_id'];
				$printed_str=$printed_str.$ar['sample_id'].'|';
			}
			else
			{
				//$not_printed[]=$ar['sample_id'];
				$not_printed_str=$not_printed_str.','.$ar['sample_id'];
			}
		}		
		//print_report_pdf_A4_ri_last($printed,'electronic report');

		
		echo '<form id=print_confirm_form method=post target=_blank>';
		echo '<button id=submit type=submit name=submit value=print_final>Print/Save PDF</button>';
		echo '<input  type=hidden name=list_of_sample value=\''.$printed_str.'\'>';
		if(strlen($not_printed_str)>0)
		{
			echo '<div class="warning">Reports of Sample ID -->('.$not_printed_str.') are not ready</div>';		
		}
		echo '</form>';

		//print_r($printed);
		//print_r($not_printed);
	}
	else
	{
		$sql_counter='insert into doctor values(\'\',sysdate(),\''.$_POST['list_of_sample'].'\')';
		//echo $sql_counter;
		$result=mysql_query($sql_counter,$link);
		//echo $result;
		//echo 'error:'.mysql_error();
		$sa=explode('|',$_POST['list_of_sample']);
		$sa_filter=array_filter($sa);
		$pdf = new MYPDF_HTML('P', 'mm', 'A4', true, 'UTF-8', false);
		$pdf->SetMargins(10,60,10); //PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT
		//$pdf->SetFont('courier', '', 8);
		foreach($sa_filter as $si)
		{
			//print_report_pdf_A4_ri_last($pdf,$si,$_SESSION['login']);
			print_single_report_html_pdf($pdf,$si,$_SESSION['login']);
		}
		$pdf->Output('report.pdf', 'I');
		
	}
}

else
{
	search_form_doctor('print_report_pdf_A4_ri_last_doctor.php');
	//echo '<h1>No coditions are given for selecting records</h1>';
}



if(isset($_POST['submit']))
{
	if($_POST['submit']!='print_final')
	{
		echo '<h3 class=message>Send feedback and suggestion on WhatsApp 9664555812 (Dr S M Patel, HOD)</h3>';
		echo '</div>';		
	}
}
else
{
	echo '<h3 class=message>Send feedback and suggestion on WhatsApp 9664555812 (Dr S M Patel, HOD)</h3>';
	echo '</div>';	
}



function search_form_doctor($filename)
{
	$link=start_nchsls();
	$sql='desc sample';
	if(!$result=mysql_query($sql,$link)){echo mysql_error();}
	echo '<form id=doc_search_form action=\''.$filename.'\' method=post>';
	echo '<input id=submit type=submit name=submit value=print>';
	while($ar=mysql_fetch_assoc($result))
	{
		if($ar['Field']=='sample_id')
		{
			echo '<input class=chk type=checkbox checked name=\'chk_from_'.$ar['Field'].'\' >
					<label class=lbl >from_'.$ar['Field'].'</label>';
			echo '<input class=fld type=text name=\'from_'.$ar['Field'].'\' >';
			echo '<input class=chk type=checkbox name=\'chk_to_'.$ar['Field'].'\' >
					<label class=lbl>to_'.$ar['Field'].'</label>';
			echo '<input class=fld type=text name=\'to_'.$ar['Field'].'\' >';
		}
		elseif(	$ar['Field']=='patient_id' ||
				$ar['Field']=='patient_name' ||
				$ar['Field']=='clinician' ||
				$ar['Field']=='unit' ||
				$ar['Field']=='location')
		{		
			echo '<input class=chk type=checkbox name=\'chk_'.$ar['Field'].'\' ><label class=lbl >'.$ar['Field'].'</label>';
			if(!mk_select_from_table($ar['Field'],'',''))
			{
				  echo '<input class=fld type=text name=\''.$ar['Field'].'\' >';
			}
		}
	}
	echo '</form>';
}




function doctor_menu()
{
	echo '<div id=doctor_menu>';
	echo '<a id=doctor_item1 class=dmi href=print_report_pdf_A4_ri_last_doctor.php>Biochemistry Report</a>';
	echo '<a id=doctor_item2 class=dmi href=logout.php>Logout</a>';
	echo '<a id=doctor_item3 class=dmi href=doctor_help.html target=_blank>HELP</a>';
	echo '</div>';	
	
}

?>
