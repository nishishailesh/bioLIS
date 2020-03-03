<?php
session_start();

/*
echo '<html>';
echo '<head>';
echo '</head>';
echo '<body>';
*/
/*
echo '<pre>';
print_r($GLOBALS);
echo '</pre>';
*/

/*


	<Fasting>
		<Diabetes_Mellitus>
		
		>126
	</Fasting>
	<Post-Prandial>
		>200
	</Post-Prandial>
</Diabetes_Mellitus> 
 
 
 
 
 
  
*/

include 'common.php';

if(!login_varify())
{
	exit();
}




class MYPDF_D extends TCPDF {

	public $lab_name='NEW CIVIL HOSPITAL SURAT LABORATORY SERVICES';

	public $section_name='Biochemistry Section';

	public $section_address_phone='Near Blood Bank, 2nd Floor. Ext:317,366';

	public $address_phone='MAJURA GATE SURAT PHONE NO.0261-2244456';

	public $nabl_symbol='nabl.jpg';

	public $blank_symbol='blank.jpg';

	public $nabl_cert_no='M-0450';

	public $blank_cert_no='';

	public $bypass_autoverification='no';

	public $sample_id_array;

	public $sample_id;

	public $doctor;

	public $login='';

	public $header_y;

	public $completed;

	public $sample_type='';

	//Page header W=210 H=148

	//210 × 297 A4

	//$this->Write(0,$this->getPageWidth());

	

	

	public function Header() 

	{

		//$this->SetFont('courier', 'B', 15);

		ob_start();

		



		//Print NABL symbol if any one is accredited

		$linkk=start_nchsls();

		$sql_examination_data='select * from examination where sample_id=\''.$this->sample_id.'\' order by name_of_examination';

		$NABL_acc_counter=0;

		$result_examination_data_for_accr=mysql_query($sql_examination_data,$linkk);

		$this->completed='';

		while($acc_array=mysql_fetch_assoc($result_examination_data_for_accr))

		{

			if($acc_array['NABL_Accredited']=='Yes')

			{

				$NABL_acc_counter++;

			}		

		}

		if($NABL_acc_counter>0)

		{

			$logo_text='<img src="nabl.jpg" width="50"><br>'.$this->nabl_cert_no;

			$logo='<td rowspan="4" border="0.3" align="center" width="10%">'.$logo_text.'</td>';

		}

		else

		{

			$logo='<td rowspan="4" border="0" align="center" width="10%"></td>';

		}

		$sample_data=get_sample($this->sample_id);			

		//print_r($sample_data);

		echo '<table border="0">';

		echo '<tr>'.$logo.'<td width="90%" align="center"><h3>'.$this->lab_name.'</h3></td></tr>';

		echo '<tr><td align="center"><h5>'.$this->address_phone.'</h5></td></tr>';		

		echo '<tr><td align="center"><h5>'.$this->section_name.' '.$this->section_address_phone.'</h5></td></tr>';		

		echo '<tr><td>

					<table>

						<tr>

							<td align="left"><h3>'.$sample_data['patient_name'].' '.$sample_data['sex'].'/'.$sample_data['age'].'</h3></td>

							<td align="left"><h3>'.$sample_data['patient_id'].'</h3></td>

							<td align="left"><h3>Sample ID:'.$sample_data['sample_id'].'</h3></td>

						</tr>

						<tr>

							<td align="left"><h5>Clinician:'.$sample_data['clinician'].'</h5></td>

							<td align="left"><h5>Location:'.$sample_data['location'].'</h5></td>

							<td align="left"><h5>Unit:'.$sample_data['unit'].',Diag:'.$sample_data['diagnosis'].'</h5></td>

						</tr>

					</table>

				</td></tr>';		



		echo '</table><br>';





		echo '<table border="0.3">

						<tr>

							<td align="left" width="50%">Sample:'.$sample_data['sample_type'].','.$sample_data['sample_details'].'</td>

							<td align="left" width="50%">Preservative:'.$sample_data['preservative'].'</td>

						</tr>

						<tr>

							<td align="left">Collection:'.$sample_data['sample_collection_time'].'</td>

							<td align="left">Receipt:'.$sample_data['sample_receipt_time'].'</td>

						</tr>

						<tr>							

							<td align="left">Status:'.$sample_data['status'].' by:'.$sample_data['released_by'].'</td>

							<td align="left">Released at: '.$sample_data['released_at'].'</td>

						</tr>

				</table>';

		$myStr = ob_get_contents();

		ob_end_clean();

		$this->SetFont('courier', '', 10);

		$this->SetXY(10,10);

		$this->writeHTML($myStr, true, false, true, false, '');	

	}



	// Page footer

	public function Footer() 

	{

		$border=1;

		$this->SetFont('courier', 'B', 10);

		$this->SetXY(10,-10);

		$this->Cell(95, $h=0, $txt='Examinations marked \'No\' are not NABL Accredited.', $border, $ln=0, $align='L', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');

		$this->SetFont('courier', '', 10);

		$this->SetXY(105,-10);

		//$this->Cell(95, $h=0, $txt='Page:'.$this->getPageNumGroupAlias().'/'.$this->getPageGroupAlias(), $border, $ln=0, $align='R', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');

		$this->Cell(95, $h=0, $txt='Page:'.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), $border, $ln=0, $align='R', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');

		

		//this start at Y=127

		//210/4=52 50-20=30,70   130,170

		$border=1;

		$this->SetFont('courier', '', 20);

		$this->SetXY(10,-55);

		//$this->Cell(95, $h=10, $txt="[Completed at: ".$this->completed."] ".$this->login."               ", $border, $ln=0, $align='L', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');
		$donation='The machine doing these tests is very old.';
		$donation1='All tests are free of charge to poor patients';
		$donation2='Donate new analyser.Dr Ketan Nayak(9825327004)';
		$this->Cell(190, $h=15, $txt=$donation, $border, $ln=0, $align='L', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');

		$this->SetXY(10,-40);
		$this->Cell(190, $h=15, $txt=$donation1, $border, $ln=0, $align='L', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');

                $this->SetXY(10,-25);
		$this->Cell(190, $h=15, $txt=$donation2, $border, $ln=0, $align='L', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');


		//$this->SetXY(105,-20);

		//$this->SetFont('courier', '', 10);
		//$this->Cell(95, $h=10, $txt=$this->doctor, $border, $ln=0, $align='L', $fill=false, $link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');



	}

}








function search_form($filename)
{
	$link=start_nchsls();
	$sql='desc sample';
	if(!$result=mysql_query($sql,$link)){echo mysql_error();}
	$tr=1;
	echo '<table border=1><form action=\''.$filename.'\' target=_blank method=post>';
	echo '	<tr>
				<td title=\'1) Tickmark to include the field for search. 2) Use % as wildcard. e.g. [%esh = Mahesh,Jignesh] [Mahesh%=Mahesh,Maheshbhai, Maheshkumar]\'><input type=submit name=submit value=print></td>';
	/*echo '			<td>Technician:</td><td>';
					mk_select_from_table('technician','','');
		  echo '</td>';
	*/
		echo   '<td>Authorized Signatory:</td><td>';
					mk_select_from_table('authorized_signatory','','');
		  echo '</td>';
		  echo '</tr>';
	while($ar=mysql_fetch_assoc($result))
	{
		if($tr%3==1){echo '<tr>';}
		
		if($ar['Field']=='sample_id')
		{
			echo '<td><input type=checkbox checked name=\'chk_from_'.$ar['Field'].'\' ></td><td>from_'.$ar['Field'].'</td>';
			echo '<td><input type=text name=\'from_'.$ar['Field'].'\' ></td>';
			echo '<td><input type=checkbox name=\'chk_to_'.$ar['Field'].'\' ></td><td>to_'.$ar['Field'].'</td>';
			echo '<td><input type=text name=\'to_'.$ar['Field'].'\' >';
			$tr++;
		}
		
		else
		{		
			echo '<td><input type=checkbox name=\'chk_'.$ar['Field'].'\' ></td><td>'.$ar['Field'].'</td><td>';
			if(!mk_select_from_table($ar['Field'],'',''))
			{
				  echo '<input type=text name=\''.$ar['Field'].'\' >';
			}
		}
		echo '</td>';
		if($tr%3==0){echo '</tr>';}
		$tr++;
	}
	echo '</form></table>';
}






if(isset($_POST['authorized_signatory']))
{
if(strlen($_POST['authorized_signatory'])==0)
 {
   echo '<h4>No authorized Signatory given</h4>';
 }
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

if(isset($_POST['submit']) && substr($search_str,-7)!='sample ')
{
	$link=start_nchsls();
	if(!$search_result=mysql_query($search_str,$link)){echo mysql_error();}
	while($ar=mysql_fetch_assoc($search_result))
	{
		$printed[]=$ar['sample_id'];
	}
	foreach($printed as $value)
	{
		//if(get_sample_status($value)!='verified')
		if(!in_array(get_sample_status($value),$GLOBALS['final_stage']))
		{
			echo get_sample_status($value);
			echo ':'.$value.' is not ready. PDF report can not be printed<br>';
		}
	}

		$pdf = new MYPDF_D('P', 'mm', 'A4', true, 'UTF-8', false);
		$pdf->SetMargins(10,60,10); //PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT
		//$pdf->SetFont('courier', '', 8);
		foreach($printed as $si)
		{
			print_single_report_donation($pdf,$si,$_SESSION['login']);
		}
		$pdf->Output('report.pdf', 'I');

}
else
{
	main_menu();
	search_form('print_donation.php');
	echo '<h1>No coditions are given for selecting records</h1>';
}



function print_single_report_donation($pdf, $sample_id,$doctor)
{
	//echo $sample_id.'<br>';

	if(!is_str_interger($sample_id)){return;}
	
	$acr_check_code=array(	'-1'=>'',
					'-2'=>'',
					'-3'=>'',
					'0'=>'',
					'1'=>'low absurd',
					'2'=>'high absurd',					
					'3'=>'low critical',
					'4'=>'high critical',
					'5'=>'low abnormal',
					'6'=>'high abnormal',
					'12'=>'low abnormal',
					'13'=>'high abnormal');
	//A5=210,148
	$attachment_exist='no';
	
	$pdf->sample_id=$sample_id;
	$pdf->AddPage();
	//$pdf->startPageGroup();		
	$linkk=start_nchsls();
	$sql_examination_data='select * from examination where sample_id=\''.$pdf->sample_id.'\' order by name_of_examination';
	$result_examination_data=mysql_query($sql_examination_data,$linkk);
	$pdf->SetFont('courier','',10);
	$border=0;
	
	ob_start();
	echo '<table border="0.1" cellpadding="1px">';
	echo '<tr>
				<td width="05%" border="0.3"><b>NABL</b></td>
				<td width="20%" border="0.3"><b>Test</b></td>
				<td width="15%" border="0.3"><b>Result</b></td>
				<td width="15%" border="0.3"><b>Alert</b></td>
				<td width="20%" border="0.3"><b>Reference range</b></td>
				<td width="25%" border="0.3"><b>Method</b></td>
			</tr>';
	
	
	$attachment_exist='no';		
	while($examination_array=mysql_fetch_assoc($result_examination_data))
	{
		if($examination_array['id']==1008){$attachment_exist='yes';}
		
		echo '<tr>';
		echo '<td>'.$examination_array['NABL_Accredited'].'</td>';
		echo '<td>'.$examination_array['name_of_examination'].'</td>';
		
		if($examination_array['id']>1000)
		{
			echo '<td colspan="4"><b>'.$examination_array['result'].'</b></td>';
		}
		else
		{
			$alert=check_critical_abnormal_reportable(	$examination_array['sample_type'],
													$examination_array['code'],
													$examination_array['result']);
			$acr=$acr_check_code[$alert];
			
			if($alert==1 || $alert==2)
			{
				echo '<td><strike>'.$examination_array['result'].' ???</strike></td>';
			}
			else
			{
				echo '<td>'.$examination_array['result'].'</td>';
			}

			echo '<td>'.$acr_check_code[$alert].'</td>';
			echo '<td>'.htmlentities($examination_array['referance_range']).' '.$examination_array['unit'].'</td>';
			echo '<td>'.$examination_array['method_of_analysis'].'</td>';
		}
		
		echo '</tr>';
	}
	echo '</table>';
	
			
/*			
			$counter=$counter+5;
			$result_examination_data=mysql_query($sql_examination_data,$linkk);
			while($examination_array=mysql_fetch_assoc($result_examination_data))
			{
					if(prepare_ri_str($examination_array['id'],$value)===true)
					{

						//$pdf->Write(0,$GLOBALS['ri_str']);
						if(strlen($GLOBALS['ri_str'])>0)
						{	
							$counter=$counter+5;
							$pdf->SetXY(10,$counter);
							$pdf->writeHTML($GLOBALS['ri_str'], true, false, false, false, '');
							$counter=$pdf->GetY();
						}
						$GLOBALS['ri_str']='';	

*/	
	$myStr = ob_get_contents();
	ob_end_clean();	
	//echo $myStr;
	//return;
	$pdf->writeHTML($myStr, true, false, false, false, '');

	if($attachment_exist=='yes')
	{
		//echo '<h2 style="page-break-before: always;">xxxx</h2>';
		print_attachment_A4_html($pdf,$pdf->sample_id);
	}	

	//echo $myStr;exit(0);	
}



?>
