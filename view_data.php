<?php
session_start();

//print_r($_POST);

include 'common.php';

if(!login_varify())
{
exit();
}

main_menu();

function view_dataa($id)
{
        $link=start_nchsls();

        if(!$result_id=mysql_query('select * from view_data where id=\''.$id.'\'',$link)){echo mysql_error();}
        $array_id=mysql_fetch_assoc($result_id);
     
        $sql=$array_id['sql'];
        $info=$array_id['info'];

	////modify sql
	if(strlen($_POST['__p1'])>0){$sql=str_replace('__p1',$_POST['__p1'],$sql);$info=$info.' ['.$_POST['__p1'].'] ';}
        if(strlen($_POST['__p2'])>0){$sql=str_replace('__p2',$_POST['__p2'],$sql);$info=$info.' ['.$_POST['__p2'].'] ';}
        if(strlen($_POST['__p3'])>0){$sql=str_replace('__p3',$_POST['__p3'],$sql);$info=$info.' ['.$_POST['__p3'].'] ';}
        if(strlen($_POST['__p4'])>0){$sql=str_replace('__p4',$_POST['__p4'],$sql);$info=$info.' ['.$_POST['__p4'].'] ';}

	//////////////
//	echo $sql;

                
        $first_data='yes';
        
        if(!$result=mysql_query($sql,$link)){echo mysql_error();}


        echo '<table border=1><tr><th colspan=20 bgcolor=lightblue>'.$info.'</th></tr>';
        
        $first_data='yes';
        
        while($array=mysql_fetch_assoc($result))
        {
                if($first_data=='yes')
                {
                        echo '<tr bgcolor=lightgreen>';
                        foreach($array as $key=>$value)
                        {
                                echo '<th>'.$key.'</hd>';
                        }
                        echo '</tr>';
                        $first_data='no';
                }
                foreach($array as $key=>$value)
                {
                        echo '<td>'.$value.'</td>';
                }
                echo '</tr>';

        }
        echo '</table>';
}


function get_sql()
{
	$link=start_nchsls();
	if(!$result=mysql_query('select * from view_data',$link)){echo mysql_error();}

	echo '<form method=post>';
	echo '<table border=1><tr><th colspan=20>Select the data to view</th></tr>';
	echo '<tr>
		<td>__p1:<input type=text name=__p1></td>
		<td>__p2:<input type=text name=__p2></td>
		<td>__p3:<input type=text name=__p3>
		__p4:<input type=text name=__p4></td>
</tr>';
	$first_data='yes';
	
	while($array=mysql_fetch_assoc($result))
	{
		if($first_data=='yes')
		{
			echo '<tr>';
			foreach($array as $key=>$value)
			{
				echo '<th bgcolor=lightgreen>'.$key.'</th>';
			}
			echo '</tr>';
			$first_data='no';
		}
		foreach($array as $key=>$value)
		{
			if($key=='id')
			{
				echo '<td><input type=submit name=id value=\''.$value.'\'></td>';
			}
			else
			{
				echo '<td>'.$value.'</td>';
			}
		}
		echo '</tr>';

	}
	echo '</table>';
	echo '</form>';
}




echo '<h2 style="page-break-before: always;"></h2>';	
if(isset($_POST['id']))
{
	view_dataa($_POST['id']);
}
echo '<h2 style="page-break-before: always;"></h2>';	
get_sql();
?>
