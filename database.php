<?php

$hostname="localhost";
$username="root";
$pass="";
$dbname="myepi";

$link = new mysqli($hostname,$username,$pass,$dbname);

if ($link->connect_errno)
{
    printf ("Erreur connection a la base",$link->connect_errno);
    exit();

}
?>
