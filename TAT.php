<?php
session_start();
echo '
<link rel="stylesheet" type="text/css" href="date/datepicker.css" /> 
<script type="text/javascript" src="date/datepicker.js"></script>
<script type="text/javascript" src="date/timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="my_styles.css">
';

include 'common.php';


function view_data_TAT($sql,$target,$observed)
{
	$link=start_nchsls();

	if(!$result_id=mysql_query($sql,$link)){echo mysql_error();}
	$array_id=mysql_fetch_assoc($result_id);
	
	$first_data='yes';
	
	if(!$result=mysql_query($sql,$link)){echo mysql_error();}
	echo '<table border=1>';
	
	$first_data='yes';
	
	echo '<form method=post>';
	while($array=mysql_fetch_assoc($result))
	{
		if($first_data=='yes')
		{
			echo '<tr bgcolor=lightgreen>';
			foreach($array as $key=>$value)
			{
				echo '<th>'.$key.'</th>';
			}
			echo '<textarea name=sql style="display:none;">'.$sql.'</textarea>';
			echo '<th><input type=submit value=save_comment name=submit></th>';
			echo '</tr>';
			$first_data='no';
		}
		foreach($array as $key=>$value)
		{
			echo '<td><pre>'.$value.'</pre></td>';
		}
		if($array[$observed]>$array[$target])
		{
			$comment_value=get_examination_result_id(1009, $array['sample_id']);
			echo '<td><input size=100 placeholder="Write reason for delay" type=text name=\''.$array['sample_id'].'\' value=\''.$comment_value.'\'></td>';
		}
	
		echo '</tr>';
	}
	echo '</form>';
	echo '</table>';
}



function read_TAT_inputs()
{
	
	echo '<form method=post>';
	echo '<table class=style2 border=1>';
	echo '<tr><th colspan=4> Turnaround Time</th></tr>';
	
	echo '<tr><td>From</td><td>';
	echo '<input  id=start_date class="datepicker" size="10" name=start_date />';
	echo '</td></tr><tr><td>To</td><td>';
	echo '<input  id=end_date class="datepicker" size="10" name=end_date />';
	echo '</td></tr>';

	echo '<tr><td>Average</td><td>';
	echo '<input  type=checkbox name=average />';
	echo '</td></tr>';

	echo '<tr><td>Examination</td><td>';
	mk_select_from_sql("select distinct code from scope where id<1000 and code is not null order by code","code",'','');
	//echo '</td><td>';
	echo '<input  title="Ignored if average is sought" type=checkbox name=specific_examination />';
	echo '</td></tr>';

/*
	echo '<tr><td>Location</td><td>';
	mk_select_from_array_return_value('location',array('All','OPD','Ward'),'','');
	echo '</td></tr>';
*/
		
	echo '<tr><td align=center colspan=4><input name=submit type=submit value=search></td></tr>';
	echo '</table></form>';	
}

if(!login_varify())
{
exit();
}

main_menu();

read_TAT_inputs();


echo '<pre>';
//echo $_POST['sql'].'<br>';
//print_r($_POST);
echo '</pre>';	


if(!isset($_POST['submit']))
{
	exit();
}
else
{
	if($_POST['submit']=='save_comment')
	{

		foreach($_POST as $key=>$value)
		{
			if($key!='submit' && $key!='sql')
			{
				if(strlen($value)>0)
				{
					insert_single_examination($key,1009);
					save_single_examination($key,1009,$value);
				}
			}
		}				
		view_data_TAT($_POST['sql'],'Target TAT','TAT');
	}
	elseif($_POST['submit']=='search')
	{		
		$start_date=$_POST['start_date'];
		$end_date=$_POST['end_date'];

		if(isset($_POST['average']))
		{
				$sql ='select	
					code,
					TAT.OPD as `Target TAT`,
					round(avg( time_to_sec(timediff(substr(examination.details,1,19),sample_receipt_time))) /3600, 1) as AVG_TAT ,
					sum(if(round( time_to_sec(timediff(substr(examination.details,1,19),sample_receipt_time)) /3600) >TAT.OPD,1,0)) / count(code) *100 as `% excedding target TAT`
					from 
						sample,examination,TAT 
					where 
						sample.sample_id=examination.sample_id and 
						time_to_sec(timediff(sample_receipt_time,"'.$start_date.' 00:00:00"))>0 and
						time_to_sec(timediff(sample_receipt_time,"'.$end_date.' 00:00:00"))<0 	and
						location="OPD"	
						and code is not null	
						and TAT.id=examination.id
					group by
						code
					order by 
						AVG_TAT desc,code';
						
						echo '<table  class=style2 border=1><tr><th class=head>OPD</th><th class=head>Ward</th></tr><tr><td valign=top>';
						view_data_sql($sql);
						echo '</td>';
						
				$sql ='select	
					code,
					TAT.ward as `Target TAT`,
					round(avg( time_to_sec(timediff(substr(examination.details,1,19),sample_receipt_time))) /3600, 1) as AVG_TAT ,
					sum(if(round( time_to_sec(timediff(substr(examination.details,1,19),sample_receipt_time)) /3600) >TAT.OPD,1,0)) / count(code) *100 as `% excedding target TAT`

					from 
						sample,examination,TAT
						
					where 
						sample.sample_id=examination.sample_id and 
						time_to_sec(timediff(sample_receipt_time,"'.$start_date.' 00:00:00"))>0 and
						time_to_sec(timediff(sample_receipt_time,"'.$end_date.' 00:00:00"))<0 	and
						location!="OPD"		
						and code is not null	
						and TAT.id=examination.id
					group by
						code
					order by 
						AVG_TAT desc,code';
						
						echo '<td  valign=top>';
						view_data_sql($sql);
						echo '</td></tr></table>';				

		}

		else
		{
			if(isset($_POST['specific_examination']))
			{
				$sql ='select
						sample.sample_id,
						code,
						round(time_to_sec(timediff(substr(examination.details,1,19),sample_receipt_time)) /3600, 1) as TAT, 
						if(location="OPD", TAT.OPD, TAT.ward) as `Target TAT`				
						from 
							sample,examination ,TAT
							
						where 
							sample.sample_id=examination.sample_id and 
							time_to_sec(timediff(sample_receipt_time,"'.$start_date.' 00:00:00"))>0 and
							time_to_sec(timediff(sample_receipt_time,"'.$end_date.' 00:00:00"))<0 	and
							code=\''.$_POST['code'].'\'		
							and TAT.id=examination.id
						order by 
							TAT desc,code';		
			}
			else
			{
				$sql ='select
						sample.sample_id,
						code,
						round(time_to_sec(timediff(substr(examination.details,1,19),sample_receipt_time)) /3600, 1) as TAT ,
						if(location="OPD", TAT.OPD, TAT.ward)  as `Target TAT`
						from 
							sample,examination ,TAT
							
						where 
							sample.sample_id=examination.sample_id and 
							time_to_sec(timediff(sample_receipt_time,"'.$start_date.' 00:00:00"))>0 and
							time_to_sec(timediff(sample_receipt_time,"'.$end_date.' 00:00:00"))<0 	
							and code is not null	
							and TAT.id=examination.id					
						order by 
							TAT desc,code';
			}
			view_data_TAT($sql,'Target TAT','TAT');
		}
	}	
}





?>
