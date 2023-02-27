<?php
include 'database.php';

$filiere=$_POST["filiere"];
//$filiere="Génie Logiciel";
$niveau=$_POST["niveau"];
//$niveau="1 ere année";
$req="select * from td where nomFiliere = '$filiere' and nomNiveau = '$niveau' ";
$resultat=mysqli_query($link,$req);

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


?>