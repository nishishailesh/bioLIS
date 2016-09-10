<?php



/*
 <Glucose>
<Fasting>

	<Impaired_Fasting_Glucose>
		<from>
			100
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
<Post_Glucose>
	
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

</Post_Glucose>

</Glucose>

*/




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

/*

<Bilirubin>
	<Neonate>
		<Age_Unit>hour</Age_Unit>
		<Bilirubin_Unit>mg/dL</Bilirubin_Unit>
		<Total_Bilirubin>
			<age>0</age>
			<less_than>5.8</less_than>
		</Total_Bilirubin>
		<Total_Bilirubin>
			<age>6</age>
			<less_than>7.3</less_than>
		</Total_Bilirubin>
		<Total_Bilirubin>
			<age>12</age>
			<less_than>8.8</less_than>
		</Total_Bilirubin>
		<Total_Bilirubin>
			<age>18</age>
			<less_than>10.2</less_than>
		</Total_Bilirubin>
		<Total_Bilirubin>
			<age>24</age>
			<less_than>11.7</less_than>
		</Total_Bilirubin>
		<Total_Bilirubin>
			<age>30</age>
			<less_than>12.4</less_than>
		</Total_Bilirubin>
	</Neonate>
	<Adult>
		<Total_Bilirubin>
			<less_than>1.2</less_than>
		</Total_Bilirubin>
		<Direct_Bilirubin>
			<less_than>0.2</less_than>		
		</Direct_Bilirubin>
		<Indirect_Bilirubin>
			<less_than>1.2</less_than>		
		</Indirect_Bilirubin>
	</Adult>
</Bilirubin>

*/

function bilirubin_serum_reference_interval($xml,$sample_data)
{
	$GLOBALS['ri_str']='';
	if($sample_data['clinician']=='Paediatrics')
	{
		$GLOBALS['ri_str'] .= '<table border="1" align="center">';

		$GLOBALS['ri_str'] .= '<tr> <th  align="center" colspan="4">Bilirubin, Serum/Plasma, mg/dl</th></tr>';	
		$GLOBALS['ri_str'] .= '<tr> <th   align="center" colspan="4">Neonate</th></tr>';	
		$GLOBALS['ri_str'] .= '<tr>	<th >Age (Hours)</th>
									<th >Total Bilirubin</th>
									<th >Age (Hours)</th>
									<th >Total Bilirubin</th>
								</tr>';

		$GLOBALS['ri_str'] .='<tr align="center">
								<td>'.$xml->Neonate->Total_Bilirubin[0]->age.'</td>
								<td>&lt; '.$xml->Neonate->Total_Bilirubin[0]->less_than.'</td>
							</tr>';
		$GLOBALS['ri_str'] .='<tr>
								<td>'.$xml->Neonate->Total_Bilirubin[1]->age.'</td>
								<td>&lt; '.$xml->Neonate->Total_Bilirubin[1]->less_than.'</td>
							</tr>';
		$GLOBALS['ri_str'] .='<tr>
								<td>'.$xml->Neonate->Total_Bilirubin[2]->age.'</td>
								<td>&lt; '.$xml->Neonate->Total_Bilirubin[2]->less_than.'</td>
							</tr>';
		
		$GLOBALS['ri_str'] .='</table>';
	}
}

?>
