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
			
?>
