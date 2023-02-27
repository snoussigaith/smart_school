<?php

try

{

       // On se connecte à MySQL

       $bdd = new PDO('mysql:host=localhost;dbname=LONAB', 'root', '');

}

catch(Exception $e)

{

       // En cas d'erreur, on affiche un message et on arrête tout

       die('Erreur : '.$e->getMessage());

}

       

// Si tout va bien, on peut continuer



// On récupère tout le contenu de la table jeux_video

$email="ducdabadem@gmail.com";
$reponse = $bdd->query("SELECT * FROM Users where email='$email'");



// On affiche chaque entrée une à une

while ($donnees = $reponse->fetch())


{


    $nom=$donnees['nom'];
    $_POST["prenom"]=$donnees['prenom'];
    $_POST["email"]=$donnees['email'];
    $_POST["password"]=$donnees['password'];
    $_POST["date"]=$donnees['datenaiss'];
    $_POST["tel"]=$donnees['tel'];


  
   //echo ($nom);
    /*
   echo ($prenom);
   echo ($email);
   echo ($password);
   echo ($date);
   echo ($tel);

    */



}

       

$reponse->closeCursor(); // Termine le traitement de la requête



?>