<?php
session_start();


include 'common.php';

//exit if username not verified
for($i=0;$i<1000;$i++)
{
if(!login_varify())
{
        exit();
}
}

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


}

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



			
?>
