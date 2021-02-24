
<!doctype html>
<html lang="fr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <title>Gestion photocopie</title>
    <!-- Favicon-->
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    <link rel="manifest" href="images/site.webmanifest">
    
    <!-- jQuery@3.5.1 -->
    <script src="jQuery/jquery-3.5.1.min.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script> 
  </head>
  <body>

  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #EFD3F8;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Roheibé <img src="images/android-chrome-192x192.png" alt="Logo Photocopie" height="45"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item mx-2 mb-1">
          <a class="btn btn-info" href="/"><i class="bi bi-house-fill text-white" style="font-size: 1.1rem;"></i> Accueil</a>
        </li>
        <li class="nav-item mx-2 mb-1">
          <a class="btn btn-warning" href="/?page=consulter"><i class="bi bi-emoji-sunglasses-fill text-white" style="font-size: 1.1rem;"></i> Consulter</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
  
    <section class="container-fluid my-2" style="height=1200px;">

      <?php
      $_SESSION["page"] = @$_GET["page"];

      switch ($_SESSION["page"]) {
          case "consulter":
            include "consulte.php";
            break;
          case "acteurs":
            include 'acteurs.php';
            break;
          default:  
          include "copie.php";
        }
        ?>
      
    </section>
    
  </body>
</html>
