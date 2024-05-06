/*Gestion de la fonction API pour les requêtes issues de la recherche */

/**
 * Vérification que la variable form existe pour éviter les erreurs dans bundle.js
 * A la soumission du formulaire de recherche, on attend un évènement:
 * le comportement par défaut du formulaire est empêché pour éviter le rafraichissement de la page
 * On récupère et stock dans des variables les valeurs des trois champs du formulaire
 * Pour la checkbox, on attribue la valeur 0 à false et 1 à true
 * On vide le tableau qui contient la réponse de la requête apiGetJobs au chargement de la page pour afficher uniquer le résultat de la recherche et avoir un offset correct
 * Tant qu'un premier élément enfant de la liste d'offre d'emploi est présent, on supprime ce premier élément enfant ce qui garantie de les supprimer à l'affichage du résultat de la recherche
 * On appelle la fonction apiGetJobs pour afficher les résultats de la recherche
 */

if(form){
  form.addEventListener('submit', (ev) => {
    ev.preventDefault();
    
    textValue = textInput.value
    locationValue = locInput.value;
    fullTimeValue = fullTimeInput.checked;
      if(fullTimeValue === true){
        fullTimeValue = 1;
      } else{
        fullTimeValue = 0;
      }
  
      arrayJobs = [];
      while (jobList.firstElementChild) {
        jobList.removeChild(jobList.firstElementChild);
  
      }
    
      overlay.classList.remove('active');
  
    apiGetJobs()
  
  })
}


