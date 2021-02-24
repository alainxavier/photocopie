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

$argument = stripslashes($_REQUEST["argument"]);
$argument = mysqli_real_escape_string($conn, $argument);

$sql = "SELECT nom, prenom, discipline, niveau, SUM(total) FROM `impression` LEFT JOIN personnel ON impression.id_personnel = personnel.id WHERE MONTH(date_imp) = '$argument' GROUP BY prenom ORDER BY SUM(total) DESC";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $impressions = array();
    $compteur = 1;
  // output data of each row
    while($row = $result->fetch_assoc()) {
      $impressions[$compteur] = array("nom"=>$row["nom"], "prenom"=>$row["prenom"], "discipline"=>$row["discipline"], "niveau"=>$row["niveau"], "total"=>$row["SUM(total)"]);
      $compteur++;
    }
    $impressions["nombre"] = $compteur - 1;
    
    echo json_encode($impressions);
  }
  else {
  echo json_encode("0 results");
}

$conn->close();
?>