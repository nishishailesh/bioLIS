<?php
session_start();

echo '<html>';
echo '<head>';
echo '</head>';
echo '<body>';

/*
echo '<pre>';
print_r($GLOBALS);
echo '</pre>';
*/
$GLOBALS['u']='dsa453()-';
$GLOBALS['p']='f7EcQQprQChc43bC';

include 'common.php';


/////////// Report specific data////////////////
$lab_name='New Civil Hospital Surat Laboratory Services';
$section_name='Biochemistry Section';
$address_phone='2nd Floor, Near Blood Bank, NCH Surat(Guj) Ph: 2224445 Ext:317,366';
$nabl_symbol='nabl.jpg';
$blank_symbol='blank.jpg';
$nabl_cert_no='Cert. No:X-1234';
$blank_cert_no='';
$bypass_autoverification='yes';		//if 'yes'=>it will bypass autoverification


function login_varify_d($u,$p)
{
	
	return mysql_connect('127.0.0.1',$u,$p);
}

/////////////////////////////////
function select_nchsls_d($link)
{
        return mysql_select_db('biochemistry',$link);
}

function check_user($u,$p)
{
	//$_SESSION['login'],$_SESSION['password'])
	$sql='select * from user where id=\''.$u.'\'';
	if(!$result=mysqli_query($link,$sql)){return FALSE;}
	$result_array=mysqli_fetch_assoc($result);
	if($p==$result_array['password'])
	{
		return true;
	}
	else
	{
		return false;
	}
}


function search_form($filename)
{
	$link=start_nchsls();
	$sql='desc sample';
	if(!$result=mysql_query($sql,$link)){echo mysql_error();}
	$tr=1;
	echo '<table border=1><form action=\''.$filename.'\' method=post>';
	echo '	<tr>
				<td title=\'1) Tickmark to include the field for search. 2) Use % as wildcard. e.g. [%esh = Mahesh,Jignesh] [Mahesh%=Mahesh,Maheshbhai, Maheshkumar]\'><input type=submit name=submit value=print></td>
		  </tr>';
	while($ar=mysql_fetch_assoc($result))
	{
		if($tr%3==1){echo '<tr>';}
		
		if($ar['Field']=='sample_id')
		{
			echo '<td bgcolor=lightblue><input type=checkbox checked name=\'chk_from_'.$ar['Field'].'\' ></td><td  bgcolor=lightpink>from_'.$ar['Field'].'</td>';
			echo '<td ><input type=text name=\'from_'.$ar['Field'].'\' ></td>';
			echo '<td  bgcolor=lightblue><input type=checkbox name=\'chk_to_'.$ar['Field'].'\' ></td><td  bgcolor=lightpink>to_'.$ar['Field'].'</td>';
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

search_form('doctor.php');	
echo '<h2 style="page-break-before: always;"></h2>';

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
		if(get_sample_status($ar['sample_id'])=='verified')
		{
			$loc='printed at: '.$_SERVER['REMOTE_ADDR'];
			print_sample($ar['sample_id'],'electronic report',$loc);
			echo '<h2 style="page-break-before: always;"></h2>';
		}
		else
		{
			echo '<h2 style="page-break-before: always; color:red; ">Sample ID '.$ar['sample_id'].' is not verified(Call the lab)</h2>';
		}
	}
}
else
{
	echo '<h1>No coditions are given for selecting records</h1>';
	
}

?>
