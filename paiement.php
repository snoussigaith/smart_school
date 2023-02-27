<?php
 session_start();
// ouvrir une connexion vers mysql ici
/*
$code=$_POST["code"];
$montant=$_POST["montant"];
$telephone=$_POST["telephone"];
*/

$code=543234;
$montant=5000;
$telephone=56682415;




$url = "https://testom.orange.bf:9008/payment";
$postData = "
<?xml version='1.0' encoding='UTF-8'?>
<COMMAND>
    <TYPE>OMPREQ</TYPE>
    <customer_msisdn>56682415</customer_msisdn>
    <merchant_msisdn>05690494</merchant_msisdn>
    <api_username>CASSEAUTO</api_username>
    <api_password>Orange@123</api_password>
    <amount>2000</amount>
    <PROVIDER>101</PROVIDER>
    <PROVIDER2>101</PROVIDER2>
    <PAYID>12</PAYID>
    <PAYID2>12</PAYID2>
    <otp>767736</otp>
    <reference_number>789233</reference_number>
    <ext_txn_id>201500068544</ext_txn_id>
</COMMAND>";
$curlHandler = curl_init();
curl_setopt($curlHandler, CURLOPT_URL, $url);
curl_setopt($curlHandler, CURLOPT_POST, true);
//curl_setopt($curlHandler, CURLOPT_HTTPHEADER, $headers);
curl_setopt($curlHandler, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curlHandler, CURLOPT_POSTFIELDS, $postData);
curl_setopt($curlHandler, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($curlHandler, CURLOPT_SSL_VERIFYPEER, 0);


$response = curl_exec($curlHandler);
$err = curl_errno($curlHandler);
$error = curl_error($curlHandler);
 
curl_close($curlHandler);


    if ($err) {
    echo json_encode("cURL Error #:" . $err . " " . $error );
    }


     else {

       echo json_encode("felicitation");


     }

//FIN ENVOIE








?>
