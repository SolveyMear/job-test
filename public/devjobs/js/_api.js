// Requete pour afficher toutes les offres

// Création d'une variable qui contiendra dans un tableau les reponses de la requete et seront accessibles partout
let arrayJobs = [];

/**
 * Fichiers js associés: main.js, search.js, dom.js et domSearch.js
 * @param {number} offset 
 */
function apiGetJobs(offset = arrayJobs.length) {
  const request = new XMLHttpRequest();

  // Stockage des paramètres dans des variables pour gérer les deux appels d'API dans la même fonction
    let mainRequest = "jobs?offset=" + offset;
    let searchRequest = "jobs/search?text=" + encodeURIComponent(textValue) + "&location=" + encodeURIComponent(locationValue) + "&fulltime=" + fullTimeValue + "&offset=" + offset;

  // Variable qui contient par défaut une valeur et qui servira à vérifier quel type de requête choisir
    let hasSearch = false;

  // On vérifie si au moins l'une des trois valeurs de recherche est vraie, alors on lance la requete searchRequest
    if(textValue){
      hasSearch = true;
    } else if(locationValue){
      hasSearch = true;
    } else if(fullTimeValue){
      hasSearch = true;
    };


  // Si aucune n'est vraie on lance la requete globale, sinon la requête de recherche
    if(hasSearch === false){
      request.open("GET", "../" + mainRequest , true);
    } else if(hasSearch === true){
        request.open("GET", "../" + searchRequest , true);
    };

  //start loader animation
  loader.classList.add('visible');

  request.addEventListener("readystatechange", () => {

  //stop loader animation
    loader.classList.remove('visible');

      if(request.readyState === XMLHttpRequest.DONE){
        if(request.status === 200) {
          const response = JSON.parse(request.responseText);
          const jobsArray = Object.entries(response);

  // Pour les deux types de requêtes, la réponse est passée d'un objet à un tableau puis on passe chaque item du tableau en paramètre de la fonction displayJobs, grâce à une méthode itérative
  // Chaque item du tableau est ensuite poussé dans le tableau déclaré en dehors de la fonction
        jobsArray[0][1].forEach(jobsObject  => {
          displayJobs(jobsObject)
          arrayJobs.push(jobsObject)
        }); 

        // Gestion des cas d'une erreur dans la recherche
        // Gestion du bouton load-more: si toutes les offres ont été affichées, on affiche un message à la place du bouton
        loadMessage.classList.remove('message-visible');
        errorMessage.classList.remove('error-msg-visible');
        if(arrayJobs.length === 0){
          loadMoreBtn.classList.add('hidden')
          errorMessage.classList.add('error-msg-visible');
          } else if(arrayJobs.length >= response.total){
            loadMoreBtn.classList.add('hidden')
            loadMessage.classList.add('message-visible');
            } else {
              loadMoreBtn.classList.remove('hidden');
              };

        } else {
          console.error("Il y a eu une erreur lors de l'affichage des offres, contactez le service informatique.");
          };
      };
    });
    request.send();
  };




/**
 *Fonction d'appel des détails d'une offre
 Fichiers associés: detail.js et domDetails.js
 * @param {number} id 
 * l'id est récupéré dans le fichier details.js
 */
function apiGetJobDetails(id) {
  const request = new XMLHttpRequest();
  request.open("GET", "../job/" + id, true);
  request.addEventListener("readystatechange", () => {
    if(request.readyState === XMLHttpRequest.DONE){
        if(request.status === 200) {
          const response = JSON.parse(request.responseText);

          displayJobDetails(response);

          } else {
            console.error("Il y a eu une erreur lors de l'affichage du détail de l'offre, contactez le service informatique.");
        }
      }
    });
  request.send();
};


//A ajouter plus tard: un message d'erreur en cas d'erreur serveur, à ajouter ligne 77 et retirer ligne 49