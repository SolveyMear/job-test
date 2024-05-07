/* Gestion de la fonction apiGetJobs qui gère l'affichage de toutes les offres et des offres issues de la recherche.
*/

//Création des variables en globale pour les utiliser dans les fonctions
let textValue;
let locationValue;
let fullTimeValue;

//Verifier que l'URL actuelle dans la fenêtre du navigateur, si c'est le cas, appeler la fonction apiGetJobs
if (window.location.pathname !== "/detail.html") {
  apiGetJobs();

  //Appel de la fonction API au clic du bouton créé dans dom.js
  loadMoreBtn.addEventListener('click', () => {
    document.querySelector('.job-item:last-child .link-detail').focus();
  
    apiGetJobs();
  });
};

