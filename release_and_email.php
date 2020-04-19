<?php
session_start();

echo '<html>';
echo '<head>';
echo '<link rel="stylesheet" href="my_styles.css">	';	

echo '<style>


#release_container
{
		display:grid;
		grid-row-gap:5px;
		grid-template-columns: auto auto ;
	  	grid-template-rows: 1fr 19fr;
		justify-items: start;
		align-items: start;
		background-color:lightgray;
}

#top_bar
{
	display:grid;
	grid-column-start: 1; 
	grid-column-end: 2; 
	grid-row-start: 1; 
	grid-row-end: 2;
	align-self:center;
	justify-self:center;
	grid-template-columns: auto auto ;
  	grid-template-rows: auto;

}

#get_sample_id_form
{
	display:grid;
	grid-template-columns: auto auto auto auto;
	grid-column-start: 1; 
	grid-column-end: 2; 
	grid-row-start: 1; 
	grid-row-end: 2;
}

#report
{
	grid-column-start: 1; 
	grid-column-end: 2; 
	grid-row-start: 2; 
	grid-row-end: 3;
}

@media only screen and (min-device-width: 600px)
{
	#release_container
	{
			display:grid;
			grid-row-gap:5px;
			grid-template-columns: auto auto ;
			grid-template-rows: 1fr 19fr;
			justify-items: start;
			align-items: start;
			background-color:lightgray;
	}
	#delta
	{
		grid-column-start: 2; 
		grid-column-end: 3; 
		grid-row-start: 1; 
		grid-row-end: 4;
		align-self:start;
		justify-self:start;
	}
}

@media only screen and (max-device-width: 600px)
{

	#release_container
	{
			display:grid;
			grid-row-gap:5px;
			grid-template-columns: auto auto ;
			grid-template-rows: auto auto auto;
			justify-items: start;
			align-items: start;
			background-color:lightgray;
	}
	#delta
	{
		grid-column-start: 1; 
		grid-column-end: 2; 
		grid-row-start: 3; 
		grid-row-end: 4;
		align-self:start;
		justify-self:start;
	}
}


</style>';

echo '</head>';
echo '<body>';


//echo '<pre>';print_r($_POST);echo '</pre>';

include 'common.php';
include '/var/gmcs_config/staff.conf';

//exit if username not verified
if(!login_varify())
{
	exit();
}

//exit if not doctor

$dr=substr($_SESSION['login'],0,2);
if($dr!='Dr')
{
	echo 'not authorized to release';
	exit(0);
}

main_menu();

//set current sample id
if(!isset($_POST['action']))
{
	$sample_id=1;
}
else
{
	if($_POST['action']=='next')
	{
		$sample_id=$_POST['sample_id']+1;
	}
	else if($_POST['action']=='prev')
	{
		$sample_id=$_POST['sample_id']-1;
	}
	else
	{
		$sample_id=$_POST['sample_id'];
	}


	if($_POST['action']=='release')
	{
			release_report($sample_id);
			if(any_test_critical($sample_id))
			{
				send_email($sample_id);
			}
	}
	
	if($_POST['action']=='unrelease')
	{
			unrelease_report($sample_id);
	}
	
	if($_POST['action']=='autoverify')
	{
		autoverify($sample_id,'autoverify_action.php','no');
		autoverify($sample_id,'autoverify_action.php','yes');
	}

	if($_POST['action']=='edit')
	{
		edit_sample($_POST['sample_id'],'edit_request.php	','','no');
		exit(0);
	}	
}	

echo '<div id=release_container>';
	//First
	//echo '<div id=top_bar>
			//<div id=top_message class="message">Status:</div>
			//<div id=status class=warning>'.get_sample_status($sample_id).'</div>
	//</div>';
	//Second
	echo '<form method=post id=get_sample_id_form>';
		echo '<button  id=view class=submit_button type=submit tabindex="1" value=view name=action >View</button>';
		echo '<input id=prev tabindex="2" class=submit_button type=submit value=prev name=action>';
		echo '<input type=text name=sample_id id=sample_id value=\''.$sample_id.'\'>';

		echo '<input id=next class=submit_button type=submit value=next name=action >';
		if(get_sample_status($sample_id)=='released')
		{
			echo '<button id=release class=submit_button name=action value=unrelease>Un-Release</button>';
		}
		else
		{
			echo '<button formtarget=_blank id=release class=submit_button name=action value=edit>Edit</button>';
			echo '<button id=release class=submit_button name=action value=autoverify>Autoverify</button>';
			echo '<button id=release class=submit_button name=action value=release>Release</button>';
		}
	echo '</form>';
	//Third
	echo '<div id=report>';
					print_single_report_realhtml($sample_id,'');
	echo '</div>';
	//forth
	echo '<div id=delta>';
					print_chronology_of_a_sample($sample_id);
	echo '</div>';

echo '</div>';

function release_report($sample_id)
{
	//verify then release
	//echo 'release';
	//autoverify($sample_id,'autoverify_action.php','yes');
	
	//will not be released in any other event
	if(get_sample_status($sample_id)=='verified')
	{
		set_sample_status($sample_id,'released',$_SESSION['login'],strftime('%Y-%m-%d %H:%M:%S'));
	}
}

function unrelease_report($sample_id)
{
	//echo 'release';
	
	//will not be released in any other event
	//unrelease then verify
	set_sample_status($sample_id,'analysed','','');
	//autoverify($sample_id,'autoverify_action.php','yes');

}

function set_sample_status($sample_id,$status,$by,$at)
{
	$link=start_nchsls();
	
	$sql='update sample set status=\''.$status.'\' ,
							released_by=\''.$by.'\',
							released_at=\''.$at.'\'
							where sample_id=\''.$sample_id.'\'';
	//echo $sql;
	if(!mysql_query($sql,$link)){echo mysql_error();}
}

function any_test_critical($sample_id)
{
	return get_examination_result_id('1005',$sample_id);
}

function send_email($sample_id)
{
	$content=print_single_report_realhtml_for_email($sample_id,'');
	$email_to='biochemistrygmcs@gmail.com';
	$subject='Report of Sample '.$sample_id;
	//$sql='insert into email (`to`,subject,content) values(\''.$email_to.'\',\''.$subject.'\',\''.$content.'\')';
	//echo $sql;
	save_email($email_to,$subject,$content);
}



function print_single_report_realhtml_for_email($sample_id,$doctor)

{

	ob_start();

	if(!is_str_interger($sample_id)){return;}



	sample_header_realhtml($sample_id);

	

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

	

		

	$linkk=start_nchsls();

	

	

	

	

	

	

	$sql_examination_data='select * from examination where sample_id=\''.$sample_id.'\' order by name_of_examination';

	$result_examination_data=mysql_query($sql_examination_data,$linkk);

	$border=0;

	


	echo '<table border="1" cellpadding="1px">';

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

			echo '<td>'.$examination_array['result'].'</td>';

			$alert=check_critical_abnormal_reportable(	$examination_array['sample_type'],

													$examination_array['code'],

													$examination_array['result']);

			$acr=$acr_check_code[$alert];

			echo '<td>'.$acr_check_code[$alert].'</td>';

			echo '<td>'.htmlentities($examination_array['referance_range']).' '.$examination_array['unit'].'</td>';

			echo '<td>'.$examination_array['method_of_analysis'].'</td>';

		}

		

		echo '</tr>';

	}

	echo '</table>';

	

			

	$myStr = ob_get_contents();

	ob_end_clean();	

	//echo $myStr;
	return $myStr;


}

function save_email($emailid,$subject,$content,$sms=0)
{
	$main_server_link=get_remote_link('11.207.1.1',$GLOBALS['main_server_main_user'],$GLOBALS['main_server_main_pass']);
	if(!$main_server_link){echo 'can not connect to email server'; return false;}
	$sql='INSERT INTO email(`to`,`subject`,`content`,`sent`,sms,sms_sent)
	 	VALUES (\''.$emailid.'\',\''.$subject.'\',\''.
	 	my_safe_string($content,$main_server_link).'\',0,\''.$sms.'\',0)';

     	//echo $sql;
	//function run_query($link,$db,$sql)

	if(!run_query($main_server_link,'email',$sql))
	{
		echo '<span class="text-danger">email not sent</span><br>';
	}
	else
	{
		echo '<span class="text-success">Email Sent</span><br>';
	}
	

}

function my_safe_string($link,$str)
{
	return mysql_real_escape_string($link,$str);
}
 
function get_remote_link($ip,$u,$p)
{
	$link=mysql_connect($ip,$u,$p);
	if(!$link)
	{
		echo 'error1:'.mysql_error($link); 
		return false;
	}
	return $link;
}


?>
