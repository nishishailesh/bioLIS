<?php 
session_start();

require_once('tcpdf/tcpdf.php');
require_once('common.php');

class MYPDF_BARCODE extends TCPDF 
{
	public function Header() 
	{

	}

	// Page footer
	public function Footer() 
	{

	}
}


if(!login_varify())
{
	exit();
}

//print_r($_POST);
$link=start_nchsls();


$pdf=initialize_pdf();
print_lable_general($link,'biochemistry',$pdf,$_POST['id'],$_POST['copy']);
$filename='Reagent_ID_'.$_POST['id'].'.pdf';
$pdf->Output($filename, 'I');

function print_lable_general($link,$d,$pdf, $id,$copy=1)
{
	$sql='select * from reagent where id=\''.$id.'\'';
	//echo $sql;
	//return;
	$result=run_query($link,$d,$sql);

	$pdf->SetFont('helveticaB', '', 9);
	$ar=get_single_row($result);
		//echo '<pre>';
		//print_r($ar);
		//break;
		//Array
		//(
			//[id] => 2089117
			//[reagent_name] => NA_K_STDB_MOPS_ISE
			//[lot] => 1
			//[dop] => 2018-10-26
			//[doe] => 2018-04-25
			//[prepared_by] => Dr.Nikunj
			//[pack_size] => 1000
			//[serial_number] => 1
			//[reagent_status] => accepted
			//[temperature_on_receipt] => 
			//[dor] => 0000-00-00
			//[doo] => 0000-00-00
			//[detail] => 
		//)

		//$ln1=$ar['id'];
		$ln1=$ar['reagent_name'];
		$ln2='Lot# '.$ar['lot'].'    Cal Dt';
		$ln3=$ar['prepared_by'];
		$ln4='Mgf: '.$ar['dop'].' Exp: '.$ar['doe'];
		
		for($i=0;$i<$copy;$i++)
		{
			$pdf->AddPage();
			//3 mm allside
			//height 25-6=19 for 4 lines 5 mm avilable
			//50-6=44 widht avilable
		
			//$pdf->write1DBarcode($ln1, 'C128', 3, 3 , 33, 5 , 0.4, array(), 'N');

			$pdf->SetXY(3,3);
			$pdf->Cell (44,5,$ln1,$border=0, $ln=1, $align='', $fill=false, 
				$link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');	

			$pdf->SetXY(3,8);
			$pdf->Cell (44,5,$ln2,$border=0, $ln=1, $align='', $fill=false, 
				$link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');	

			$pdf->SetXY(3,13);
			$pdf->Cell (44,5,$ln3,$border=0, $ln=1, $align='', $fill=false, 
				$link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');	

			$pdf->SetXY(3,18);
			$pdf->Cell (44,5,$ln4,$border=0, $ln=1, $align='', $fill=false, 
				$link='', $stretch=1, $ignore_min_height=false, $calign='T', $valign='M');			
		}

}


function initialize_pdf()
{
	// for barcode
	$style = array(
		'position' => '',
		'align' => 'C',
		'stretch' => false,
		'fitwidth' => true,
		'cellfitalign' => '',
		'border' => false,
		'hpadding' => 'auto',
		'vpadding' => '0',
		'fgcolor' => array(0,0,0),
		'bgcolor' => false, //array(255,255,255),
		'text' => true,
		'font' => 'helvetica',
		'fontsize' => 10,
		'stretchtext' => 4
	);


	$pdf = new MYPDF_BARCODE('', 'mm', array("50","25"), true, 'UTF-8', false);
	
	$pdf->SetMargins(0,0, $right=-1, $keepmargins=true);
	$pdf->setPrintFooter(false);
	$pdf->setPrintHeader(false);
	$pdf->SetAutoPageBreak(TRUE, 0);
	$pdf->setCellPaddings(0,0,0,0);

	return $pdf;

	//minimum 2 mm margin
	//25-4=21 available Y
	//50-5=46 available X
	//5 line 1, 10 barcode, 5 line 3
}


?>
