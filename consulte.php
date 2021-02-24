<div class="alert fade show shadow-lg row text-center text-uppercase border pt-1" role="alert" id="alert-success">
  <p class="text-danger fw-bold fs-5 m-1"><i class="bi bi-text-paragraph"></i> Statistiques <i class="bi bi-calculator"></i></p>

  <div class="col-md-5 border pb-1">
    <label for="nom-prenoms" class="form-label"><i class="bi bi-people-fill text-success" ></i> Par enseignant :</label>
    <div class="d-flex"><input class="form-control me-2" type="search" placeholder="Saisissez le nom" size="50" list="datalistOptions" id="nom-prenoms"><datalist id="datalistOptions"></datalist><button class="btn btn-outline-primary" id="rechercher" type="button">OK</button></div>
  </div>    

  <div class="col-md-2 border pb-1">
    <label for="classes" class="form-label"><i class="bi bi-house-door-fill text-success"></i> Par classe : </label>
    <div class="d-flex"><select class="form-select me-2" id="classes">
    </select><button class="btn btn-outline-primary" id="btn-classes" type="button">OK</button></div>
  </div>

  <div class="col-md-2 border pb-1">
    <label for="entite" class="form-label"><i class="bi bi-building text-success"></i> Par entité : </label>
    <div class="d-flex"><select class="form-select me-2" id="entite">
      <option value="college">Collège</option>
      <option value="lycee">Lycée</option>
      <option value="primaire">Primaire</option>
    </select><button class="btn btn-outline-primary" id="btn-entite" type="button">OK</button></div>
  </div>
  <div class="col-md-3 border pb-1">
    <label for="entite" class="form-label"><i class="bi bi-calendar3 text-success"></i> Liste Copies par mois</label>
    <div class="d-flex"><select class="form-select me-2" id="par-mois">
    </select><button class="btn btn-outline-primary" id="btn-mois" type="button">OK</button></div>
  </div>

</div>
  
    <!-- Le graphique -->
  <div id="mon-canvas">
    
  </div>

  
    
<!-- chart.js@2.8.0 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script src="js/consulter.js"></script>