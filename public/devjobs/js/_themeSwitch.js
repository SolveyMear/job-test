const toggleButton = document.querySelector('.theme-toggle');
const page = document.querySelector('.page');


applyThemePreferences();

/**
 * Au chargement de la page, on appelle la fonction applyThemePreference qui va:
 * Créer une variable qui contiendra par défaut un thème clair
 * Créer une variable qui contiendra la présence ou non d'un thème dans le localStorage
 * Si un thème est présent, on stock le choix dans la variable choice et on l'applique
 * Si aucun thème n'est présent en localStorage, alors on cherche les préférences utilisateur et si un choix est présent, on l'applique
 */

function applyThemePreferences() {
  let choice = "light"
  
  const hasTheme = localStorage.getItem('theme');

  if(hasTheme === "dark"){
    choice = 'dark';
  } else if(hasTheme === 'light'){
    choice = 'light';
  } else{
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)');
    const prefersLight = window.matchMedia('(prefers-color-scheme: light)');
    if(prefersDark.matches){
      choice = 'dark';
    } else if(prefersLight.matches) {
      choice = 'light'
    }
  }
    
  if(choice === 'dark'){
    page.classList.add('dark');
    toggleButton.checked = true;
  } else if (choice === 'light') {
    page.classList.remove('dark');
    toggleButton.checked = false;
  }
  
  localStorage.setItem('theme', choice); 
}

/* Au clic, on applique la fonction swithTheme qui va gérer l'application et le stockage du choix dans le localStorage*/
function switchTheme() {
  page.classList.toggle('dark');
  const isDark = page.classList.contains('dark');
  localStorage.setItem('theme', isDark ? 'dark' : 'light');
}

toggleButton.addEventListener('change', switchTheme);