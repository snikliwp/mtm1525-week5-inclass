<?php
//data.php

header("Content-Type: text/plain");

if( isset( $_POST['fullname'])  ){
	if(!empty($_POST['fullname']) ){
		echo 'message=Welcome ' . strtoupper( $_POST['fullname'] );
	}else{
		echo 'message=empty';	
	}
}else{
	echo 'message=missing';
}
?>