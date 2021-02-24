<?php
//Données d'entête
header("Access-Control-Allow-Credentials:	true");
header("Access-Control-Allow-Headers:	X-API-KEY, X-FIELDS, CONTENT-TYPE, ACCEPT, ACCEPT-CHARSET, ACCEPT-LANGUAGE, CACHE-CONTROL, CONTENT-ENCODING, CONTENT-LENGTH, CONTENT-SECURITY-POLICY, CONTENT-TYPE, COOKIE, ETAG, HOST, IF-MODIFIED-SINCE, KEEP-ALIVE, LAST-MODIFIED, ORIGIN, REFERER, USER-AGENT, X-FORWARDED-FOR, X-FORWARDED-PORT, X-FORWARDED-PROTO");
header("Access-Control-Allow-Methods:	PUT, HEAD, GET, OPTIONS, DELETE");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Max-Age:	21600");
header("Content-Type: application/json; charset=UTF-8");
header("Cache-Control: public");
header("Pragma: public");
header("X-XSS-Protection:	1; mode=block");

require "config.php";

if(isset($_REQUEST["argument"]) && isset($_REQUEST["ReqType"])) {
  $argument = stripslashes($_REQUEST["argument"]);
$argument = mysqli_real_escape_string($conn, $argument);

$ReqType = stripslashes($_REQUEST["ReqType"]);
$ReqType = mysqli_real_escape_string($conn, $ReqType);

  switch ($ReqType) {
    case 1://par personne
      $sql = "SELECT SUM(total), MONTH(date_imp) FROM `impression` WHERE id_personnel = $argument GROUP BY MONTH(date_imp)";
      break;
    case 2://par classe
      $sql = "SELECT SUM(total), MONTH(date_imp) FROM `impression` WHERE classe = '$argument' GROUP BY MONTH(date_imp)";
      break;
    case 3://par entite
      $sql = "SELECT SUM(total), MONTH(date_imp) FROM `impression` LEFT JOIN personnel ON impression.id_personnel = personnel.id WHERE niveau = '$argument' GROUP BY MONTH(date_imp)";
      break;
    default://par mois
      $sql = "SELECT SUM(total), MONTH(date_imp) FROM `impression` GROUP BY MONTH(date_imp)";
  }
} else {
  $sql = "SELECT SUM(total), MONTH(date_imp) FROM `impression` GROUP BY MONTH(date_imp)";
}


$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $impressions = array();
    $compteur = 1;
  // output data of each row
    while($row = $result->fetch_assoc()) {

      $impressions[$row["MONTH(date_imp)"]] = $row["SUM(total)"];      
    }
    //$impressions["nombre"] = $compteur - 1;

    //requette 2
    /*$sql = "SELECT SUM(total) FROM `impression`";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $impressions["totaux"] = $row;*/
    
    echo json_encode($impressions);
  }
  else {
  echo json_encode("0 results");
}

$conn->close();
?>