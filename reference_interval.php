<?php



/*
 <Glucose>
<Fasting>

	<Impaired_Fasting_Glucose>
		<from>
			110
		</from>
		<to>
			125
		</to>
	</Impaired_Fasting_Glucose>
	
	<Diabetes_Mellitus>
		<greater_than>
			126
		</greater_than>
	</Diabetes_Mellitus>
	
</Fasting>
<Post-prandial>
	
	<Impaired_Glucose_Tolerance>
		<from>
			140
		</from>
		<to>
			199
		</to>
	</Impaired_Glucose_Tolerance>
	
	<Diabetes_Mellitus>
		<greater_than>
			200
		</greater_than>
	</Diabetes_Mellitus>

</Post-prandial>

</Glucose>

*/


function glucose_serum_reference_interval($xml)
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



?>
