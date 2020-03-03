<?php
session_start();


//echo '<pre>';print_r($_POST);echo '</pre>';

echo '<script>
	function showhide(one) {
		if(document.getElementById(one).style.display == "none")
		{
			document.getElementById(one).style.display = "block";
		}
		else
		{
			document.getElementById(one).style.display = "none";
		}
	}

</script>';

include 'common.php';

if(!login_varify())
{
exit();
}

function make_qc_string($sd,$title)
{
if($sd<0)					//-1.2
	{	
		$sd_final=max($sd,-4);		//-1.2
		$sd_final=40+(10*$sd_final);	//40-12=28
	}
else if($sd>0)					//1.2
	{
		$sd_final=min($sd,4);		//1.2
		$sd_final=(10*$sd_final)+40;	//12+40=52
	}
else if($sd==0)
	{
	$sd_final=$sd;			//0
	$sd_final=40;			//40
	}

$sd_final=(int)($sd_final);

$str='';	


for ($i=0;$i<=80;$i++)
	{
	if($i==$sd_final)
		{
		$str=$str.'<font color=red ><tt>X</tt></font>';
		}
	else if($i==40)
		{
		$str=$str.'<font><tt>I</tt></font>';
		}
	else if($i==50 || $i==30)
		{
		$str=$str.'<font color=green><tt>|</tt></font>';
		}
	else if($i==20 || $i==60)
		{
		$str=$str.'<font color=blue><tt>|</tt></font>';
		}
	else if($i==70 || $i==10)
		{
		$str=$str.'<font color=red><tt>|</tt></font>';
		}	
	else if($i%10)
		{
		$str=$str.'<font color=white><tt>.</tt></font>';
		}
	else 
		{
		$str=$str.'<font><tt>|</tt></font>';
		}

	

	}
		//$str=$str.'='.$sd.'='.$sd_final;
	return $str;
}

function draw_qc_new($equipment_name,$year,$month,$day,$hour,$code)
{
	
	
}

function draw_qc($equipment_name,$year,$month,$day,$hour,$select,$code,$all_examinations,$normal_qc_id,$abnormal_qc_id)
{
	echo '<form method=post>';
	echo '<input type=hidden name=equipment_name value=\''.$equipment_name.'\'>';
	echo '<input type=hidden name=left value=\''.$normal_qc_id.'\'>';
	echo '<input type=hidden name=right value=\''.$abnormal_qc_id.'\'>';
	echo '<input type=hidden name=submit value=show_LJ>';
	echo '<input type=hidden name=year value=\''.$year.'\'>';
	echo '<input type=hidden name=month value=\''.$month.'\'>';
	echo '<input type=hidden name=day value=\''.$day.'\'>';
	echo '<input type=hidden name=hour value=\''.$hour.'\'>';
	echo '<input type=hidden name=period value=\''.$select.'\'>';
		echo '<input type=hidden name=code value=\''.$code.'\'>';
		echo '<input type=hidden name=qc_normal value=\''.$normal_qc_id.'\'>';
		echo '<input type=hidden name=qc_abnormal value=\''.$abnormal_qc_id.'\'>';
		if($all_examinations=='on')
			{
			echo '<input type=hidden name=all_examinations value=on >'	;	
			}

	view_qc_form();
	echo '<table border=1 style="border-collapse:collapse;">';
	echo '<tr><th colspan=3>LJ Chart for '.$equipment_name.'</th></tr>
			<tr><td></td><th> QC-'.$normal_qc_id.'</th><th>QC-'.$abnormal_qc_id.'</th></tr>';
	//QYYMMDDHH
	if($select=='Year')
	{
		$normal_qc_from=
						 ($normal_qc_id*100000000)
						 +(($year-2000)*1000000);
		//$normal_qc_to=$normal_qc_from + 999999;
		  $normal_qc_to=$normal_qc_from + 123124;

		$abnormal_qc_from=
						 ($abnormal_qc_id*100000000)
						 +(($year-2000)*1000000);
		$abnormal_qc_to=$abnormal_qc_from + 123124;
	}
	
	else if($select=='Month')
	{
		$normal_qc_from=
						 //$normal_qc_id*100000000
						+ ($year-2000)*1000000
						+       $month*10000;
	  //$normal_qc_to=$normal_qc_from + 9999;
		$normal_qc_to=$normal_qc_from + 3124;		
		$abnormal_qc_from=
						 //$abnormal_qc_id*100000000
						+ ($year-2000)*1000000
						+       $month*10000;
		$abnormal_qc_to=$abnormal_qc_from + 3124;
	}	
	else if($select=='Day')
	{
		$normal_qc_from=
						 //$normal_qc_id*100000000
						 +($year-2000)*1000000
						       +$month*10000
						         +$day*100;
		$normal_qc_to=$normal_qc_from + 99;
		
		$abnormal_qc_from=
						 //$abnormal_qc_id*100000000
						 +($year-2000)*1000000
						       +$month*10000
						         +$day*100;
		$abnormal_qc_to=$abnormal_qc_from + 99;
	}	

	else if($select=='Hour')
	{
	$normal_qc_from=
						 //$normal_qc_id*100000000
						+ ($year-2000)*1000000
						+       $month*10000
						+         $day*100
						+         $hour;

	$normal_qc_to=	$normal_qc_from;
	
	$abnormal_qc_from=
						 //$abnormal_qc_id*100000000
						+ ($year-2000)*1000000
						+       $month*10000
						+         $day*100
						+         $hour;

	$abnormal_qc_to=	$abnormal_qc_from;
	}
	
	//echo $normal_qc_from.'-'.$normal_qc_to.'<br>';
	//echo $abnormal_qc_from.'-'.$abnormal_qc_to.'<br>';
	$link=start_nchsls();

	for($i=$normal_qc_from;$i<=$normal_qc_to;$i++)
	{
	if($all_examinations=='on')
	{
			$sql_qc_normal= 
			'SELECT *
			FROM 	`qc` 
			where  
					equipment_name=\''.$equipment_name.'\' 
					and 
					sample_id='.($i+$normal_qc_id*100000000);
			
			$sql_qc_abnormal= 
			'SELECT *
			FROM 	`qc` 
			where  
					equipment_name=\''.$equipment_name.'\' 
					and 
					sample_id='.($i+$abnormal_qc_id*100000000);
	}
	else
	{
			$sql_qc_normal= 
			'SELECT *
			FROM 	`qc` 
			where  
					equipment_name=\''.$equipment_name.'\' 
					and 
					sample_id='.($i+$normal_qc_id*100000000).'
					and 
					code=\''.$code.'\'';		

			$sql_qc_abnormal= 
			'SELECT *
			FROM 	`qc` 
			where  
					equipment_name=\''.$equipment_name.'\' 
					and 
					sample_id='.($i+$abnormal_qc_id*100000000).'
					and 
					code=\''.$code.'\'';	
	}

	//echo $sql_qc_normal.'<br>';
	//echo $sql_qc_abnormal.'<br>';
	
		$result_qc_normal=mysql_query($sql_qc_normal,$link);
		echo mysql_error();
		
		$result_qc_abnormal=mysql_query($sql_qc_abnormal,$link);
		echo mysql_error();
		
		$sql_comment='select * from qc_comment where  equipment_name=\''.$equipment_name.'\' and sample_id=\''.$i.'\'';
		if($result_comment=mysql_query($sql_comment,$link))
		{	
			$result_comment_array=mysql_fetch_assoc($result_comment);	
		}
		
		if(mysql_num_rows($result_qc_normal)>0 || mysql_num_rows($result_qc_abnormal)>0)
		{
		echo '<tr><td bgcolor=lightgray cellpadding=0 title=\''.$result_comment_array['comment'].'\'><button name=sample_id value='.$i.'>'.$i.'</button></td>
		
		<td>';
		
			while($array_qc_normal=mysql_fetch_assoc($result_qc_normal))
			{
				if($array_qc_normal['sd']>0)
				{
					$nsd=round((($array_qc_normal['result']-$array_qc_normal['target'])/$array_qc_normal['sd']),1);
					$id='id_'	.$array_qc_normal['sample_id']
								.$array_qc_normal['repeat_id']
								.$array_qc_normal['code']
								.$array_qc_normal['time_data'];
					
					$title=	'<table 
								style="position:absolute;display:none;background-color:lightgray;" 
								id=\''.$id.'\'>
							<tr><td>QC Sample</td><td>'.$array_qc_normal['sample_id'].'</td></tr>
							<tr><td>Code</td><td>'.$array_qc_normal['code'].'</td></tr>
							<tr><td>Result</td><td>'.$array_qc_normal['result'].'</td></tr>
							<tr><td>Target</td><td>'.$array_qc_normal['target'].'</td></tr>
							<tr><td>SD</td><td>'.$array_qc_normal['sd'].'</td></tr>
							<tr><td>SDI</td><td>'.$nsd.'</td></tr>
							<tr><td>Lot</td><td>'.$array_qc_normal['lot'].'</td></tr>
							</table>';
							
							
					if($array_qc_normal['comment']=='-1')
					{
						$code_display='<font color=red>'.str_pad($array_qc_normal['code'],4,'_').'</font>';
					}
					else
					{
						$code_display=str_pad($array_qc_normal['code'],4,'_');
					}
					$use_qc=	$array_qc_normal['equipment_name'].'|'.
								$array_qc_normal['sample_id'].'|'.
								$array_qc_normal['repeat_id'].'|'.
								$array_qc_normal['time_data'].'|'.
								$array_qc_normal['code'];
							
					//echo '<table border=0><tr><td><tt>'.str_pad($array_qc_normal['code'],4,'_').'</tt></td><td>';
					echo '<table border=0><tr><td  style="padding: 0;">
					
					<button  style="padding: 0;"   name=use_qc value=\''.$use_qc.'\'><tt>'.$code_display.'</tt></button></td>
					<td onclick="showhide(\''.$id.'\')" >';
					echo make_qc_string( ($array_qc_normal['result']-$array_qc_normal['target'])/$array_qc_normal['sd'],$title );
					echo $title.'</td></tr></table>';
				}
			}
		echo '</td>';
		echo '<td>';
			while($array_qc_abnormal=mysql_fetch_assoc($result_qc_abnormal))
			{
				if($array_qc_abnormal['sd']>0)
				{

					$nsd=round((($array_qc_abnormal['result']-$array_qc_abnormal['target'])/$array_qc_abnormal['sd']),1);
					$idd='id_'	.$array_qc_abnormal['sample_id']
								.$array_qc_abnormal['repeat_id']
								.$array_qc_abnormal['code']
								.$array_qc_abnormal['time_data'];
								
					$title=	'<table 
								style="position:absolute;display:none;background-color:lightgray;" 
								id=\''.$idd.'\'>
							<tr><td>QC Sample</td><td>'.$array_qc_abnormal['sample_id'].'</td></tr>
							<tr><td>Code</td><td>'.$array_qc_abnormal['code'].'</td></tr>
							<tr><td>Result</td><td>'.$array_qc_abnormal['result'].'</td></tr>
							<tr><td>Target</td><td>'.$array_qc_abnormal['target'].'</td></tr>
							<tr><td>SD</td><td>'.$array_qc_abnormal['sd'].'</td></tr>
							<tr><td>SDI</td><td>'.$nsd.'</td></tr>
							<tr><td>Lot</td><td>'.$array_qc_abnormal['lot'].'</td></tr>
							</table>';
			
				if($array_qc_abnormal['comment']=='-1')
					{
						$code_display_ab='<font color=red>'.str_pad($array_qc_abnormal['code'],4,'_').'</font>';
					}
					else
					{
						$code_display_ab=str_pad($array_qc_abnormal['code'],4,'_');
					}				
					$use_qc=	$array_qc_abnormal['equipment_name'].'|'.
								$array_qc_abnormal['sample_id'].'|'.
								$array_qc_abnormal['repeat_id'].'|'.
								$array_qc_abnormal['time_data'].'|'.
								$array_qc_abnormal['code'];		
								
					echo '<table border=0><tr><td  style="padding: 0;">
					
					<button  style="padding: 0;"   name=use_qc value=\''.$use_qc.'\'><tt>'.$code_display_ab.'</tt></button></td>
					<td onclick="showhide(\''.$idd.'\')" >';			
					
					echo make_qc_string( ($array_qc_abnormal['result']-$array_qc_abnormal['target'])/$array_qc_abnormal['sd'] , $title);
					echo $title.'</td></tr></table>';
				}
			}
		echo '</td></tr>';
		}
	}		
	echo '</table></form>';
}

function add_edit_qc_comment($sample_id,$equipment_name,$comment)
{
	$link=start_nchsls();
	$sql='insert into qc_comment (equipment_name,sample_id,comment) values (\''.$equipment_name.'\' , \''.$sample_id.'\' , \''. $comment.'\')';
	if(!$result=mysql_query($sql,$link))
	{
		echo 'insert:'.mysql_error().'<br>';
		$sql='update qc_comment set comment=\''. $comment.'\' where equipment_name=\''.$equipment_name.'\' and sample_id=\''.$sample_id.'\'';
		if(!$result=mysql_query($sql,$link))
		{
			echo 'update:'.mysql_error().'<br>';
		}
	}
}



function view_qc_form()
{
		if(
	        isset($_POST['year'])&&
            isset($_POST['month'])&&
            isset($_POST['day'])&&
            isset($_POST['hour'])&&
            isset($_POST['left'])&&
            isset($_POST['right'])&&
            isset($_POST['period'])&&
            isset($_POST['equipment_name'])&&
            isset($_POST['code'])&&
            isset($_POST['submit'])&&
            isset($_POST['qc_normal'])&&
            isset($_POST['qc_abnormal'])
         )
		{
		echo '<input type=hidden name=year value=\''.$_POST['year'].'\'>';
		echo '<input type=hidden name=month value=\''.$_POST['month'].'\'>';
		echo '<input type=hidden name=day value=\''.$_POST['day'].'\'>';
		echo '<input type=hidden name=hour value=\''.$_POST['hour'].'\'>';
		echo '<input type=hidden name=left value=\''.$_POST['left'].'\'>';
		echo '<input type=hidden name=right value=\''.$_POST['right'].'\'>';
		echo '<input type=hidden name=period value=\''.$_POST['period'].'\'>';
		echo '<input type=hidden name=equipment_name value=\''.$_POST['equipment_name'].'\'>';
		echo '<input type=hidden name=code value=\''.$_POST['code'].'\'>';
		echo '<input type=hidden name=submit value=\''.$_POST['submit'].'\'>';
		echo '<input type=hidden name=qc_normal value=\''.$_POST['qc_normal'].'\'>';
		echo '<input type=hidden name=qc_abnormal value=\''.$_POST['qc_abnormal'].'\'>';
		if(isset($_POST['all_examinations']))
			{
			echo '<input type=hidden name=all_examinations value=\''.$_POST['all_examinations'].'\'>'	;	
			}
		} 
}

main_menu();

if(isset($_POST['save_comment']))
{
	add_edit_qc_comment($_POST['sample_id'],$_POST['equipment_name'],$_POST['comment']);
	$sql='select * from qc_comment where  equipment_name=\''.$_POST['equipment_name'].'\' and sample_id=\''.$_POST['sample_id'].'\'';
	$link=start_nchsls();
	if($result=mysql_query($sql,$link))
	{	
		$qc_comment_array=mysql_fetch_assoc($result);
		echo 'Following data was saved<br>';
		echo '<pre>';
		print_r($qc_comment_array);
		echo '</pre>';
	}
	

}  
            
if(isset($_POST['use_qc']))
{
	$link=start_nchsls();
	//[use_qc] => Erba_XL_640|512100419|531933|2012-10-04 19:05:48|ALT
	$data=explode('|',$_POST['use_qc']);
	//print_r($data);
	$sql='update qc set comment=comment*(-1) where 
						equipment_name=\''.$data[0].'\' and
						sample_id=\''.$data[1].'\' and
						repeat_id=\''.$data[2].'\' and
						time_data=\''.$data[3].'\' and
						code=\''.$data[4].'\' 
					'; 
	//echo $sql.'<br>';
	//echo 'Refresh the main page<br>';
	if(!$result=mysql_query($sql,$link))
	{
		echo 'use_qc:'.mysql_error().'<br>';
	}
}

//if(!isset($_POST['submit']))
//{

	$qct=array(0,1,2,3,4,5,6,7,8,9);

echo '<table border=1><tr><td align=top>';
//////////

	echo '<form method=post >';
	
	echo '<table style="width: 100%;height: 100%;" align=top bgcolor=lightgreen ><tr>';
	echo '<th colspan=10><h3>Set up LJ chart</h3></th></tr>';
	echo '<tr><td>Date:</td><td>';read_date_time(4);	echo '</td>';
	echo '<td>Select:
					</td><td>
					<select name=period>
					<option name=select_year>Year</option>
					<option selected name=select_month>Month</option>
					<option name=select_day>Day</option>
					<option name=select_hour>Hour</option>	
					</select>
					</td></tr>';
	echo '	</tr><td>Equipment:</td><td colspan=10>';
			mk_select_from_sql('select equipment_name from qc_equipment','equipment_name','','');
	echo '	Left:';
	mk_select_from_array_return_value('left',$qct,'','5');
	echo '	Right:';
	mk_select_from_array_return_value('right',$qct,'','8');
	echo '</td></tr>';
	
			echo '	</tr><td>Examination:</td><td>';
						mk_select_from_sql('select distinct code from qc_target','code','','');
	
	if(isset($_POST['all_examinations']))
	{
	echo '	All Examinations:<input type=checkbox checked name=all_examinations></tr>';
	}
	else
	{
	echo '	All Examinations:<input type=checkbox name=all_examinations></tr>';
	}
		echo '	<tr>
				<th colspan=10><input type=submit name=submit value=show_LJ></th>
			</tr>';
	echo '</table></form>';





///////////
echo '</td><td>';
///////////

	echo '<form method=post>';
	echo '<table style="height:100%;background-color:lightblue"><tr>';
	echo '<th colspan=10><h3>Insert QC Manually</h3></th></tr>';

	echo '<tr><td>Date:';read_date_time(4);	echo '</td>';
	echo '</tr>';
	echo '	</tr><td>Equipment:';
			mk_select_from_sql('select equipment_name from qc_equipment','equipment_name','','');
	echo '</td></tr>';
	echo '<td>Type';
					mk_select_from_array_return_value('lefti',$qct,'','5');
				echo '<input type=text name=qc_normal></td></tr><tr><td>Type';
					mk_select_from_array_return_value('righti',$qct,'','8');
				echo '<input type=text name=qc_abnormal><td></tr>';	
	echo '	<tr>';

	echo '<td>Examination:';
			mk_select_from_sql('select distinct code from qc_target','code','','');	
	echo '<input type=submit name=submit value=insert_qc></td></tr>';
				
	
	echo '</table>';
	echo '</form>';

////////////
echo '</td></tr></table>';




//}

if(isset($_POST['sample_id']) && !isset($_POST['comment']))
{
	$sql='select * from qc_comment where  equipment_name=\''.$_POST['equipment_name'].'\' and sample_id=\''.$_POST['sample_id'].'\'';
	$link=start_nchsls();
	if($result=mysql_query($sql,$link))
	{	
		$qc_comment_array=mysql_fetch_assoc($result);
		
	}
	echo '<table bgcolor=lightblue><tr>';
	echo '<td colspan=10><h1>Add/Edit QC Comment</h1></td></tr>';
	echo '<form method=post>';
	view_qc_form();
	echo '<input type=hidden name=equipment_name value=\''.$_POST['equipment_name'].'\'>';
	echo '<input type=hidden name=sample_id value=\''.$_POST['sample_id'].'\'>';
	echo '<tr><th>['.$_POST['sample_id'].']['.$_POST['equipment_name'].']</th></tr>';
	echo '<tr><td>Comment:</td><td><textarea rows=5 cols=50 name=comment>'.$qc_comment_array['comment'].'</textarea></td></tr>';
	echo '<tr><td><input type=submit name=save_comment value=save_comment></td></tr>';
	echo '</form>';
	echo '</table>';
}

if(isset($_POST['submit']))
{
	if($_POST['submit']=='show_LJ')
	{	
		if(isset($_POST['all_examinations']))
		{	
		draw_qc($_POST['equipment_name'],$_POST['year'],$_POST['month'],$_POST['day'],$_POST['hour'],$_POST['period'],$_POST['code'],$_POST['all_examinations'],$_POST['left'],$_POST['right']);
		}
		else
		{
		draw_qc($_POST['equipment_name'],$_POST['year'],$_POST['month'],$_POST['day'],$_POST['hour'],$_POST['period'],$_POST['code'],'',$_POST['left'],$_POST['right']);
		}
	}	
	if($_POST['submit']=='insert_qc')
	{
		$link=start_nchsls();
          
		$sample_id_normal=$_POST['lefti']*100000000+(($_POST['year']-2000)*1000000)+$_POST['month']*10000+$_POST['day']*100+$_POST['hour'];
		$sample_id_abnormal=$_POST['righti']*100000000+(($_POST['year']-2000)*1000000)+$_POST['month']*10000+$_POST['day']*100+$_POST['hour'];


		
		if(is_str_num($_POST['qc_normal']))
		{
			$qc_data=get_target($sample_id_normal,$_POST['equipment_name'],$_POST['code']);
			$sqln = 'INSERT INTO qc (`equipment_name`, `sample_id`, `repeat_id`, `time_data`, `code`, `result`, `target`, `sd`,lot, `comment`) 
			                 VALUES (	\''.$_POST['equipment_name'].	'\', 
										\''.$sample_id_normal.		'\', 
										0,
										\''.strftime('%Y-%m-%d %H:%M:%S').		'\',
										\''.$_POST['code'].	'\',
										\''.$_POST['qc_normal'].	'\',
										\''.$qc_data['target'].	'\',
										\''.$qc_data['sd'].	'\',
										\''.$qc_data['lot'].'\' ,
										\'1\')';
			echo $sqln;					
			$result=mysql_query($sqln,$link);
			echo mysql_error();
		}
		
		if(is_str_num($_POST['qc_abnormal']))
		{
			$qc_data=get_target($sample_id_abnormal,$_POST['equipment_name'],$_POST['code']);
			$sqla = 'INSERT INTO qc (`equipment_name`, `sample_id`, `repeat_id`, `time_data`, `code`, `result`, `target`, `sd`,lot, `comment`) 
			                 VALUES (	\''.$_POST['equipment_name'].	'\', 
										\''.$sample_id_abnormal.		'\', 
										0,
										\''.strftime('%Y-%m-%d %H:%M:%S').		'\',
										\''.$_POST['code'].	'\',
										\''.$_POST['qc_abnormal'].	'\',
										\''.$qc_data['target'].	'\',
										\''.$qc_data['sd'].	'\',
										\''.$qc_data['lot'].'\' ,
										\'\')';
			echo $sqla;		
			$result=mysql_query($sqla,$link);
			echo mysql_error();
		}

	}
	
}









?>
