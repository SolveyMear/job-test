// Gestion de l'apparition de la "modale" au clic du bouton de recherche avancée

if(document.querySelector('.filter-button')){
  document.querySelector('.filter-button').addEventListener('click', showModal)
}


/**
 * Au clic du bouton de recherche avancée, ajout de la classe active à l'élément qui a aussi la classe overlay (par défaut cachée)
 * Au clic de la classe overlay (qui représente toute la page), on appelle hideModal
 */
const overlay = document.querySelector('.overlay');

function showModal() {
  overlay.classList.add('active');
  overlay.addEventListener('click', hideModal)
}

/**
 * Au clic d'un élément qui contient la classe overlay
 * On retire la classe active
 * On retire l'évenement pour qu'il ne soit plus écouté dès lors que la modale est fermée et éviter les fuites de mémoire (merci Thomas! ) 
 */
function hideModal(ev) {
  if(ev.target.classList.contains('overlay')){
    ev.target.classList.remove('active')
    removeEventListener('click', hideModal)
  } 
}