<?php
include 'database.php';

$query = $link->query("SELECT idfiliere,nomFiliere FROM Filiere ");
$result = array();
while($rowData = $query->fetch_assoc()){
    $result[]=$rowData;
}

echo json_encode($result);


?>