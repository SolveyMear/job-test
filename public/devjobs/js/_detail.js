// Gestion de la fonction d'appel API des détails des offres

// On récupère le paramètre id dans l'url de la page 2, on le passe en paramètre de la fonction API et on appelle la fonction au chargement de la page 2

const urlParams = new URLSearchParams(window.location.search);
const id = urlParams.get('id');

  apiGetJobDetails(id);


//https://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
