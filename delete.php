<?php 
  require('config.php');
  session_start();

  $id_copie = stripslashes($_REQUEST['line']);
  $id_copie = mysqli_real_escape_string($conn, $id_copie);

  // sql to delete a record

  $sql = "DELETE FROM impression WHERE id=$id_copie";

  if ($conn->query($sql) === TRUE) {
    echo "La copie a été supprimé!";
    header("Location: /");
  } else {
    echo "Une erreur s'est produite : " . $conn->error;
  }

  $conn->close();
?>