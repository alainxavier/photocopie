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

$requette = stripslashes($_REQUEST["req"]);
$requette = mysqli_real_escape_string($conn, $requette);

if(isset($_REQUEST["niv"])) {
  $niveau = stripslashes($_REQUEST["niv"]);
  $niveau = mysqli_real_escape_string($conn, $niveau);
  $sql = "SELECT * FROM `$requette` WHERE niveau = '$niveau'";
} else {
  if ($requette == "classe") {
    $sql = "SELECT * FROM `$requette`";
  } else {
    $sql = "SELECT * FROM `$requette` GROUP BY prenom ORDER BY nom, prenom";
  }  
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  if ($requette == "classe") {
    $classes = array();
    $compteur = 1;
  // output data of each row
    while($row = $result->fetch_assoc()) {
      $classes[$compteur] = array("id"=>$row["id"], "classe"=>$row["classe"], "niveau"=>$row["niveau"]);
      $compteur++;    
    }
    $classes["nombre"] = $compteur - 1;
    echo json_encode($classes);

  } else {
    $personnes = array();
    $compteur = 1;
  // output data of each row
    while($row = $result->fetch_assoc()) {
      $personnes[$compteur] = array("id"=>$row["id"], "nom"=>$row["nom"], "prenom"=>$row["prenom"], "discipline"=>$row["discipline"], "niveau"=>$row["niveau"]);
      $compteur++;    
    }
    $personnes["nombre"] = $compteur - 1;
    echo json_encode($personnes);
  }  

} else {
  echo "0 results";
}
$conn->close();
?>