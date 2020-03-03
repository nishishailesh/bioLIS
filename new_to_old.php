<?php

function mysql_connect($ip,$u,$p)
{
	$GLOBALS['link']=mysqli_connect('127.0.0.1',$u,$p);
	return $GLOBALS['link'];
}

function mysql_select_db($db,$link)
{
	 return mysqli_select_db($link,$db);
}

function mysql_query($sql,$link)
{
	return mysqli_query($link,$sql);
}

function mysql_fetch_assoc($result)
{
	return mysqli_fetch_assoc($result);
}

function mysql_num_rows($result)
{
	return mysqli_num_rows($result);
}

function mysql_affected_rows($link)
{
	mysqli_affected_rows($link);
}

function mysql_error()
{
	mysqli_error($GLOBALS['link']);
}

function mysql_real_escape_string ($str,$link)
{
	return mysqli_real_escape_string ($link, $str);
}


?>
