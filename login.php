<?php

$con=mysqli_connect("localhost","root","","myepi");
if (!$con)
{

    echo json_encode("La connexion a la base de donnee a echouer");

}

$cnib_passport=$_POST["cnib_passport"];
//$cnib_passport="1011EPI";
$password=$_POST["password"];
//$password="12345678";
$req="select * from etudiant where cnib_passport = '$cnib_passport' and password = '$password' ";
$resultat=mysqli_query($con,$req);

$count = mysqli_num_rows($resultat);
$data=mysqli_fetch_array($resultat);
if ($count >= 1)
{

   echo json_encode("success");



}
else
{
    echo json_encode("Erreur");
 }



/*

session_start();
$login=$_GET["login"];
$password=$_GET["password"];
$req="select * from Users where login = '$login' and password = '$password' ";
$con=mysqli_connect("localhost","root","","LONAB");
$resultat=mysqli_query($con,$req);

$i=0;
$nom="";
$prenom="";

while($ligne=mysqli_fetch_array($resultat,MYSQLI_NUM)){
    $i++;
    $nom=$ligne[1];
    $prenom=$ligne[2];

}
$_SESSION['nom']=$nom;
$_SESSION['prenom']=$prenom;


if ($i==1)
{
    header("location:acceuil.html");
}
else {
    header("location:login.html");
}
*/

?>
