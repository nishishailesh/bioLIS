<?php



function glucose_serum_reference_interval($xml,$sample_data)
{
	$GLOBALS['ri_str']='';
	
	$GLOBALS['ri_str'] .= '<table border="1"  align="center">';

	$GLOBALS['ri_str'] .= '<tr><th colspan="4">Glucose, Serum/Plasma, mg/dl</th></tr>';	
	$GLOBALS['ri_str'] .= '<tr><th colspan="4">Clinical Decision Intervals</th></tr>';	
	$GLOBALS['ri_str'] .= '<tr><th colspan="2">Fasting</th><th colspan="2" >Post Glucose (75 gm, 2 hours) </th></tr>';

	$GLOBALS['ri_str'] .='<tr><td>Diabetes Mellitus</td><td>>'.$xml->Fasting->Diabetes_Mellitus->greater_than.'</td>';
	$GLOBALS['ri_str'] .='<td>Diabetes Mellitus</td><td>>'.$xml->{'Post_Glucose'}->Diabetes_Mellitus->greater_than.'</td></tr>';
	
	$GLOBALS['ri_str'] .='<tr><td>Impaired Fasting Glucose</td><td>'.$xml->Fasting->Impaired_Fasting_Glucose->from.'-'.$xml->Fasting->Impaired_Fasting_Glucose->to.'</td>';
	$GLOBALS['ri_str'] .='<td>Impaired Glucose tolereance</td><td>'.$xml->{'Post_Glucose'}->Impaired_Glucose_Tolerance->from.'-'.$xml->{'Post_Glucose'}->Impaired_Glucose_Tolerance->to.'</td></tr>';

	$GLOBALS['ri_str'] .= '<tr><th colspan="4">Source: '.$xml->Source.'</th></tr>';	

	$GLOBALS['ri_str'] .='</table>';
}


function bilirubin_serum_reference_interval($xml,$sample_data)
{
	$GLOBALS['ri_str']='';
	if($sample_data['location']=='F3N(503)')
	{
		
		$GLOBALS['ri_str'] .= '<table border="1" align="center">';

		$GLOBALS['ri_str'] .= '<tr> <th  align="center" colspan="6">';

		
		$GLOBALS['ri_str'] .= 	$xml->Analyte_Unit.
								', '.
								$xml->Sample_Type;
		$GLOBALS['ri_str'] .='</th></tr>';	

		$GLOBALS['ri_str'] .='<tr><td colspan="3">Neonate, Full term, Total Bilirubin (NICE 2016)</td><td colspan="3">Adult and Children Reference Interval</td></tr>';	
	
		$GLOBALS['ri_str'] .='<tr>
								<td>Age (hrs)</td><td>Phototherapy</td><td>Ex.Transfusion</td>
								<td>Total Bilirubin</td><td>Direct Bilirubin</td><td>Indirect Bilirubin</td>
								</tr>';
		$GLOBALS['ri_str'] .='<tr>
								<td>'.$xml->{'Class'}[0]->Subclass[0]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[0]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[0]->interval->exchange_transfusion->more_than.'</td>
								<td>'.$xml->{'Class'}[1]->Subclass[0]->interval->less_than.'</td>
								<td>&lt;'.$xml->{'Class'}[1]->Subclass[1]->interval->less_than.'</td>
								<td>&lt;'.$xml->{'Class'}[1]->Subclass[2]->interval->less_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[1]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[1]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[1]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[2]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[2]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[2]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[3]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[3]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[3]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[4]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[4]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[4]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[5]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[5]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[5]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[6]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[6]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[6]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[7]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[7]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[7]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[8]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[8]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[8]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[9]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[9]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[9]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[10]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[10]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[10]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[11]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[11]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[11]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[12]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[12]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[12]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[13]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[13]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[13]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[14]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[14]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[14]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[15]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[15]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[15]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[16]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[16]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[16]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[17]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[17]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[17]->interval->exchange_transfusion->more_than.'</td>
								</tr><tr>
								<td>'.$xml->{'Class'}[0]->Subclass[18]->age.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[18]->interval->phototherapy->more_than.'</td>
								<td>>'.$xml->{'Class'}[0]->Subclass[18]->interval->exchange_transfusion->more_than.'</td>
						
								</tr>';
		
		$GLOBALS['ri_str'] .='</table>';
	}
	else
	{
		
		$GLOBALS['ri_str'] .= '<table border="1" align="center">';

		$GLOBALS['ri_str'] .= '<tr> <th  align="center" colspan="3">';

		
		$GLOBALS['ri_str'] .= 	$xml->Analyte_Unit.
								', '.
								$xml->Sample_Type;
		$GLOBALS['ri_str'] .='</th></tr>';	

		$GLOBALS['ri_str'] .='<tr><td colspan="3">Adult and Children Reference Interval</td></tr>';	
	
		$GLOBALS['ri_str'] .='<tr>
								<td>Total Bilirubin</td><td>Direct Bilirubin</td><td>Indirect Bilirubin</td>
								</tr>';
		$GLOBALS['ri_str'] .='<tr>
								<td>'.$xml->{'Class'}[1]->Subclass[0]->interval->less_than.'</td>
								<td>&lt;'.$xml->{'Class'}[1]->Subclass[1]->interval->less_than.'</td>
								<td>&lt;'.$xml->{'Class'}[1]->Subclass[2]->interval->less_than.'</td>
								</tr>';
		
		$GLOBALS['ri_str'] .='</table>';		
		
	}
}


function creatinine_serum_reference_interval($xml,$sample_data)
{
	$GLOBALS['ri_str']='';
		
		$GLOBALS['ri_str'] .= '<table border="1" align="center">';

		$GLOBALS['ri_str'] .='<tr><td colspan="2">Creatinine Reference Interval,Serum/Plasma, mg/dL </td></tr>';	
	
		$GLOBALS['ri_str'] .='<tr>
								<td>Male:'.$xml->Subclass[0]->Interval->From.'-'. $xml->Subclass[0]->Interval->To.'</td>
								<td>Female:'.$xml->Subclass[1]->Interval->From.'-'. $xml->Subclass[1]->Interval->To.'</td>
								</tr>';
		
		$GLOBALS['ri_str'] .='</table>';		
}


function uric_acid_serum_reference_interval($xml,$sample_data)
{
	$GLOBALS['ri_str']='';
		
		$GLOBALS['ri_str'] .= '<table border="1" align="center">';

		$GLOBALS['ri_str'] .='<tr><td colspan="2">Uric Acid Reference Interval,Serum/Plasma, mg/dL </td></tr>';	
	
		$GLOBALS['ri_str'] .='<tr>
								<td>Male:'.$xml->Subclass[0]->Interval->From.'-'. $xml->Subclass[0]->Interval->To.'</td>
								<td>Female:'.$xml->Subclass[1]->Interval->From.'-'. $xml->Subclass[1]->Interval->To.'</td>
								</tr>';	
		$GLOBALS['ri_str'] .='</table>';		
}

?>
