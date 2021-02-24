$(document).ready(function(){
    var personnel;
    var personne;
    var discipline;
    var ide;
    var lesClasses = '';
    var nbrePage = 0;
    var nbreCopie = 0;
    var rectoVerso = "Non";
    var formatPapier = "A4";
    var ligne = 0;
    var total;
    var intitule;

    function formulaire () {        
        //Affiche formulaire
        jQuery('#recherche').html('');
        jQuery('#recherche').append('<p class="navbar-brand text-danger"><i class="bi bi-printer-fill text-success"></i> Enregistrer des copies <i class="bi bi-file-earmark-person-fill text-success"></i><div class="d-flex"><input class="form-control me-2" type="search" placeholder="Rechercher par nom et prénom" size="50" list="datalistOptions" aria-label="Search" id="nom-prenoms"><datalist id="datalistOptions"></datalist><button class="btn btn-outline-success" id="rechercher" type="button"> Rechercher</button></div>');
        var nombre = personnel["nombre"];
        for (var i = 1; i <= nombre; i++) {
            var optionVal = (personnel[i]["nom"] + " " + personnel[i]["prenom"]);
            //remplacement d'appostrophe
            var optionValu = optionVal.replace(/'/g, "&apos;");
            //affichage données liste options
            
            jQuery("#datalistOptions").append("<option value='" + optionValu + "'>");
        }
    }

    function rechercher () {
        jQuery("#rechercher").click(function () {
            personne = jQuery('#nom-prenoms').val();
            if(personne){//traitement erreur
                jQuery('#nom-prenoms').css("border", "solid 1px #ced4da");
                jQuery("section").append('<div id="zone0"></div>');
                jQuery("section").append('<div id="zone2"></div>');

                correspondre();

            } else {//traitement 
                jQuery('#nom-prenoms').css("border", "solid 1px red");
                jQuery('#nom-prenoms').prop("placeholder", "Veuillez remplir ce champ");
            }   
        });
    }
    
    function correspondre () {
        //correspondance
        var test = -1;
        var cpt = 0;
        while(test == -1) {
            cpt++;
            var prenom = personnel[cpt]["prenom"];
            //console.log(prenom);
            var test = personne.search(prenom);
            //console.log(cpt);        
        }
        ide = personnel[cpt]["id"];
        discipline = personnel[cpt]["discipline"];
        jQuery("#recherche").html('');
        jQuery("#recherche").append('<div class="d-flex "><table class="table table-bordered"><tr><th>ENSEIGNANT(E)</th><th class="text-primary">' + personne + '</th><th>DISCIPLINE</th><th class="text-primary">' + discipline + '</th></tr></table></div><div class="d-flex "><button class="btn btn-outline-danger" id="relancer" type="button">Nouvelle recherche</button></div>');
        jQuery("#zone0").append('<div id="zone1"></div>');
        chargeClasse ();

        jQuery("#relancer").click(function () {
            location.reload();
        });
    }

    //fonction de chargement des classes
    function chargeClasse () {
        //chargement des données classes
        jQuery.getJSON("lecture.php?req=classe", function(data) {
            var nombre = data["nombre"];
            jQuery("#zone1").html('');
            lesClasses = '';
            jQuery("#zone1").append('<div class="alert alert-secondary" role="alert" id="classes-form"><span class="fs-5 text-danger">Sélectionner une ou plusieurs classes </span>: </div>');   
            for (var i = 1; i <= nombre; i++) {
                var optionVal = (data[i]["classe"]);
                //affichage données liste options             
                jQuery("#classes-form").append("<div class='form-check form-check-inline' id='" + optionVal + "'></div>");
                jQuery("#" + optionVal).append("<input class='form-check-input' type='checkbox' id='classes' value='" + optionVal + "'>");
                jQuery("#" + optionVal).append("<label class='form-check-label' for='classes'>" + optionVal + "</label>");
            }
            jQuery("#classes-form").append('<div class="position-absolute bottom-0 end-0"><button class="btn btn-outline-primary" id="ajoute-classe" type="button">Valider</button></div>');
            
            ajouterClasse ();
        });
    }

    function ajouterClasse () {
        //liste des classes
        jQuery("#ajoute-classe").click(function(){
            var listClasse = [];
            jQuery('#classes-form input:checked').each(function() {
                listClasse.push(jQuery(this).val());
            });
            if(listClasse.length <= 0) {
            jQuery('#classes-form').css("color", "red");
            } else {
                lesClasses = listClasse.join(', ');
                //console.log(lesClasses);
                jQuery("#zone1").html('');
                jQuery("#zone1").append('<div class="row g-3 text-center mb-1 px-2" id="corps">');   
                jQuery("#corps").append('<div class="col-md-1 border py-2" id="zone-classe"><label for="ajouter-classe" class="form-label">Classe(s)</label><br /><label for="ajouter-classe" class="form-label">' + lesClasses + '</label></div>');
                jQuery("#corps").append('<div class="col-md-2 border pb-2"><label for="intitule" class="form-label">Intitulé</label><select id="intitule" class="form-select"><option value="Support de cours">Support de cours</option><option value="Devoir de classe">Devoir de classe</option><option value="Devoir de niveau">Devoir de niveau</option><option value="Control">Control</option><option selected value="Divers">Divers</option></select></div>');
                jQuery("#corps").append('<div class="col-md-2 border pb-2"><label for="nombre-page" class="form-label">Nombre de page</label><input type="number" class="form-control" id="nombre-page" min="1" max="500" value="1"></div>');
                jQuery("#corps").append('<div class="col-md-2 border pb-2"><label for="nombre-copie" class="form-label">Nombre de copie</label><input type="number" class="form-control" id="nombre-copie" min="1" max="300" value="1"></div>');
                jQuery("#corps").append('<div class="col-md-2 border pb-2"><label class="form-label" for="recto-verso">Recto-verso</label><br><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="recto-verso" id="recto-verso-non" value="non" checked><label class="form-check-label" for="recto-verso">Non</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="recto-verso" id="recto-verso-oui" value="oui"><label class="form-check-label" for="recto-verso">Oui</label></div></div>');
                jQuery("#corps").append('<div class="col-md-2 border pb-2"><label for="format-papier" class="form-label">Format du papier</label><br><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="format-papier" id="format-papier-a5" value="A5"><label class="form-check-label" for="format-papier">A5</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="format-papier" id="format-papier-a4" value="A4" checked><label class="form-check-label" for="format-papier">A4</label></div><div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="format-papier" id="format-papier-a3" value="A3"><label class="form-check-label" for="format-papier">A3</label></div></div>');
                jQuery("#corps").append('<div class="col-md-1 border pb-2"><label for="valider" class="form-label"></label><br><button type="button" class="btn btn-primary align-middle" id="valider-copie">Valider</button></div>');
                
                validerCopie ();
            }
            
        });
    }

    function validerCopie () {        
        //traitement copie
    jQuery("#valider-copie").click(function(){
        if(ligne == 0){
            jQuery("#zone2").append('<div class="alert alert-dismissible fade show shadow-lg row m-1" role="alert" id="alert-success"><table class="table table-striped table-bordered table-sm text-center"><thead><tr><th scope="col">Nom et prénoms</th><th scope="col">Discipline</th><th scope="col">Classe(s)</th><th scope="col">Intitulé</th><th scope="col">Page(s)</th><th scope="col">Copie(s)</th><th scope="col">Total</th><th scope="col">R-V</th><th scope="col">Papier</th><th scope="col"></th></tr></thead><tbody id="tableau"></tbody></table></div>');
        } else {}
        ligne++;
        nbrePage = jQuery("#nombre-page").val();
        nbreCopie = jQuery("#nombre-copie").val();
        intitule = jQuery('#intitule').val();
        //console.log(intitule);
        if(jQuery("#recto-verso-oui:checked").val()) {
            rectoVerso = "Oui";
        } else {
            rectoVerso = "Non";
        }
        if(jQuery("#format-papier-a5:checked").val()) {
            formatPapier = "A5";
        } else if(jQuery("#format-papier-a3:checked").val()){
            formatPapier = "A3";
        } else {
            formatPapier = "A4";
        }

        total = nbrePage * nbreCopie;

        enregistrement();
        
        chargeClasse ();        
    });
    }

    function afficheCopie (lastId) {
        //affichage liste copie
        jQuery("#tableau").append('<tr id="ligne' + ligne + '"></tr>');
        jQuery('#ligne' + ligne).append("<td>" + personne + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + discipline + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + lesClasses + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + intitule + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + nbrePage + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + nbreCopie + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + total + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + rectoVerso + "</td>");
        jQuery('#ligne' + ligne).append("<td>" + formatPapier + "</td>");
        jQuery('#ligne' + ligne).append('<td><a href="delete.php?line=' + lastId + '"><i class="bi bi-x-square text-danger"></i></td>');
    }

    function enregistrement () {
        jQuery.post("insertion.php", {id_personnel: ide, classe: lesClasses, intitule:intitule, pages: nbrePage, copie: nbreCopie, total: total, rectoverso: rectoVerso, papier: formatPapier }, function(data) {
            var lastId = parseInt(data);
            if (lastId == 0) {
            } else {
                afficheCopie(lastId);
            }                
            }
        );
    }

    //chargement des données personnel
    jQuery.getJSON("lecture.php?req=personnel", function(data) {
        personnel = data;
        formulaire();
        rechercher();
    });
    
});