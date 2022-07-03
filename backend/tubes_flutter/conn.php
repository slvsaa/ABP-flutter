<?php

$connect = new mysqli("localhost","root","","travel");

if($connect){

}else{
	echo "Connection Failed";
	exit();
}
?>