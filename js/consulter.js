jQuery(document).ready(function () {
    //les variables
    var impressions;
    var titre = "Evolution des photocopies 2020-2021";
    var mois = ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];
    var mensuel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var personnel, personne, classes, entite, periode, ide;

    //les fonctions
    function afficheCopie () {
        var nombre = impressions["nombre"];
        //effacer le graphique
        jQuery("#mon-canvas").html("");
        jQuery("#mon-canvas").append('<div class="alert alert-dismissible fade show shadow-lg row m-1 overflow-auto" role="alert" id="alert-success"><table class="table table-striped table-bordered table-sm text-center"><thead><tr><th>N°</th><th>Nom</th><th>Prénoms</th><th>Discipline</th><th>Niveau(s)</th><th>Photocopie</th></tr></thead><tbody id="tableau"></tbody></table></div>');
        for (var i = 1; i <= nombre; i++) {
            //affichage liste copie  
        jQuery("#tableau").append('<tr id="ligne' + i + '"></tr>');
        jQuery('#ligne' + i).append("<td>" + i + "</td>");
        jQuery('#ligne' + i).append("<td class='text-start'>" + impressions[i]["nom"] + "</td>");
        jQuery('#ligne' + i).append("<td class='text-start'>" + impressions[i]["prenom"] + "</td>");
        jQuery('#ligne' + i).append("<td>" + impressions[i]["discipline"] + "</td>");
        jQuery('#ligne' + i).append("<td>" + impressions[i]["niveau"] + "</td>");
        jQuery('#ligne' + i).append("<td>" + impressions[i]["total"] + "</td>");
        }
    }

    //graphique
    function graphique () {
        //effacer le graphique
        jQuery("#mon-canvas").html("");
        //créer la zone canvas
        jQuery("#mon-canvas").append('<canvas id="myChart">Your browser does not support the canvas element.<br>Votre navigateur ne prend pas en charge l\'élément canvas.</canvas>');
        //chargement du graphique
        var ctx = document.getElementById('myChart').getContext('2d');
        var gradient = ctx.createLinearGradient(0, 0, 0, 250);
        gradient.addColorStop(1, 'rgb(255, 191, 0)');
        gradient.addColorStop(0, 'rgb(255, 64, 0)');   


        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'bar',

            // The data for our dataset
            data: {
                labels: mois,
                datasets: [{
                    label: titre,
                    backgroundColor: gradient,
                    borderColor: 'rgb(255, 99, 132)',
                    data: mensuel
                }]
            },

            // Configuration options go here
            options: {
                aspectRatio: 3
            }
        });
    }

    function consulter (ReqType, argument) {
        //chargement des données personnel
        jQuery.getJSON("consulter.php?ReqType=" + ReqType +"&argument=" + argument, function(data) {
        impressions = data;
        //reinitialiser données
        mensuel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        for(var i = 1; i <= 11; i++) {
            if(impressions[i]){
                mensuel[i-1] = impressions[i];
            } else {}
        }
        graphique();
        });
    }
    
        //chargement des données personnel
    jQuery.getJSON("lecture.php?req=personnel", function(data) {
        personnel = data;
        var nombre = personnel["nombre"];
        for (var i = 1; i <= nombre; i++) {
            var optionVal = (personnel[i]["nom"] + " " + personnel[i]["prenom"]);
            //remplacement d'appostrophe
            var optionValu = optionVal.replace(/'/g, "&apos;");
            //affichage données liste options
            
            jQuery("#datalistOptions").append("<option value='" + optionValu + "'>");
        }
    });

    //chargement des données classes
    jQuery.getJSON("lecture.php?req=classe", function(data) {
        var nombre = data["nombre"];
        for (var i = 1; i <= nombre; i++) {
            var optionVal = (data[i]["classe"]);
            //affichage données liste options             
            jQuery("#classes").append("<option value='" + optionVal + "'>" + optionVal + "</option>");
        }
    });

    //chargement des données mensuelles
    jQuery.getJSON("consulter.php?", function(data) {
        impressions = data;
        for(var i = 1; i <= 11; i++) {
            if(impressions[i]){
                //Affichage mois
                jQuery("#par-mois").append("<option value='" + (i) + "'>" + mois[i-1] + "</option>");
            } else {}
        }
        });


    //exécution après interaction / rechercher
    jQuery("#rechercher").click(function () {
        personne = jQuery('#nom-prenoms').val();
        if(personne){//traitement erreur
            jQuery('#nom-prenoms').css("border", "solid 1px #ced4da");
            var test = -1;
            var cpt = 0;
            while(test == -1) {
            cpt++;
            var prenom = personnel[cpt]["prenom"];
            var test = personne.search(prenom);       
            }
            ide = personnel[cpt]["id"];            
            //executer fonction
            titre = "Evolution des photocopies 2020-2021 - Enseignant(e) : " + personne;
            consulter (1, ide);

        } else {//traitement 
            jQuery('#nom-prenoms').css("border", "solid 1px red");
            jQuery('#nom-prenoms').prop("placeholder", "Veuillez remplir ce champ");
        }   
    });

    //classes
    jQuery("#btn-classes").click(function () {
        classes = jQuery('#classes').val();
        //executer fonction
        titre = "Evolution des photocopies 2020-2021 - Classe : " + classes;
        consulter (2, classes);
    });
    //entité
    jQuery("#btn-entite").click(function () {
        entite = jQuery('#entite').val();
        titre = "Evolution des photocopies 2020-2021 - Entité : " + entite;
        consulter (3, entite);
    });
    //mois
    jQuery("#btn-mois").click(function () {
        periode = jQuery('#par-mois').val();
        //console.log(periode);
        //chargement des données personnel
        jQuery.getJSON("consulter_mensuel.php?argument=" + periode, function(data) {
            impressions = data;
            afficheCopie ();
            });
    });

    consulter ();
    
});

