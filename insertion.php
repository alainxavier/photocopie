<?php

    require "config.php";     
    // supprimer les antislashes ajoutés par le formulaire
    $id_personnel = stripslashes($_REQUEST['id_personnel']);
    $id_personnel = mysqli_real_escape_string($conn, $id_personnel);

    $classe = stripslashes($_REQUEST['classe']);
    $classe = mysqli_real_escape_string($conn, $classe);

    $intitule = stripslashes($_REQUEST['intitule']);
    $intitule = mysqli_real_escape_string($conn, $intitule);

    $pages = stripslashes($_REQUEST['pages']);
    $pages = mysqli_real_escape_string($conn, $pages);

    $copie = stripslashes($_REQUEST['copie']);
    $copie = mysqli_real_escape_string($conn, $copie);

    
    $total = stripslashes($_REQUEST['total']);
    $total = mysqli_real_escape_string($conn, $total);

    $rectoverso = stripslashes($_REQUEST['rectoverso']);
    $rectoverso = mysqli_real_escape_string($conn, $rectoverso);

    $papier = stripslashes($_REQUEST['papier']);
    $papier = mysqli_real_escape_string($conn, $papier);
    
    //requéte SQL + mot de passe crypté
    $query = "INSERT into `impression` (id_personnel, classe, intitule, pages, copie, total, rectoverso, papier, date_imp) VALUES ('$id_personnel', '$classe','$intitule', '$pages', '$copie', '$total', '$rectoverso', '$papier', NOW())";
    // Exécute la requête sur la base de données
    $resp = mysqli_query($conn, $query);
    if($resp){
        echo mysqli_insert_id($conn);
    } else {
        echo 0;
    }
    $conn->close();
?>