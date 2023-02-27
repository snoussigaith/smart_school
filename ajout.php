<?php

$con=mysqli_connect("127.0.0.1","root","root","GUIDE_CONCOURS");
if (!$con)
{

    echo ("La connexion a la base de donnee a echouer");

}


$nom=$_POST["nom"];
$prenom=$_POST["prenom"];
$email=$_POST["email"];
$password=$_POST["password"];
$date=$_POST["date"];
$tel=$_POST["tel"];

$check_email= "select * from Users where email='$email'";
$check_tel= "select * from Users where tel='$tel'";

$send_email= mysqli_query($con,$check_email);
$send_tel= mysqli_query($con,$check_tel);

$countEmail= mysqli_num_rows($send_email);
$counttel= mysqli_num_rows($send_tel);


if($countEmail == 1)
{

    echo json_encode("Email Existe");
}

else if($counttel == 1)
{

    echo json_encode("Tel Existe");
}

else
{
        $requete="insert into Users values(null,'$nom','$prenom','$tel','$date','$email','$password')";

        $results= mysqli_query($con,$requete);
        if($results>0)
        {
            echo json_encode("success");
        }
        else
        echo json_encode("echec");
}








?>
