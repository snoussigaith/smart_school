<?php

include 'database.php';
$filiere=$_POST["filiere"];
//$filiere="Génie Logiciel";
$niveau=$_POST["niveau"];
//$niveau="1 ere année";
$query = $link->query("SELECT * FROM devoir where nomFiliere = '$filiere' and nomNiveau = '$niveau' ");
$result = array();
while($rowData = $query->fetch_assoc()){
    $result[]=$rowData;
}

echo json_encode($result);

?>