// Création de la page 1

const jobList = document.querySelector('.job-list');
let loadMoreBtn = document.querySelector('.load-more');
let loadMessage = document.querySelector('.message')
let loader = document.querySelector('.newtons-cradle');
let errorMessage = document.querySelector('.error-msg');

/**
 * Création de l'élément job-item et affichage des différentes réponses qui composent une offre d'emploi
 * @param {object} jobsObject : provient de la fonction apiGetJobs dans api.js
 */
function displayJobs(jobsObject) {
  const company = jobsObject.company;
  const contract = jobsObject.contract;
  const id = jobsObject.id;
  const cLocation = jobsObject.location;
  const logoBackground = jobsObject.logoBackground;
  const title = jobsObject.position;
  const postedAt = jobsObject.postedAt;
  
  //Création d'un élément de liste qui contiendra tous les autres éléments
  const jobItem = document.createElement('li');
    jobItem.className = "job-item";
    jobItem.setAttribute("aria-label", title)
    
    const detailLink = document.createElement('a');
    detailLink.className = 'link-detail'
    detailLink.setAttribute('alt', 'Accéder aux détails de l\'offre')
    detailLink.setAttribute('href', 'detail.html?id=' + id)
    
    //Création d'un élément div qui contiendra le logo des entreprises
    const logoDiv = document.createElement('div');
    logoDiv.className = "co-logo-div";
    logoDiv.style.backgroundColor = logoBackground
    const logoSVG = document.createElement('img');
    logoSVG.setAttribute("alt", "")
    logoSVG.setAttribute("src", "https://ecf-dwwm.cefim-formation.org/static/logo/" + id + ".svg")
    
    
    logoDiv.appendChild(logoSVG)
    
    //Création d'une autre liste pour différentes infos
    const jobInfo = document.createElement('ul');
    jobInfo.className = "job-info";

    
    //Depuis quand l'annonce est-elle en ligne?
    const timeStamp = document.createElement('li');
    timeStamp.className = 'time-stamp';
    timeStamp.textContent = timeSincePosted(postedAt)
    const separator = document.createElement('span')
    separator.className = "separator"
    
    timeStamp.insertAdjacentElement('beforeend', separator)
    
    //Quel type de contrat l'entreprise propose-t-elle?
    const contractType = document.createElement('li');
    contractType.className = 'contract-type';
    contractType.textContent = contract;
    
    jobInfo.append(timeStamp, contractType);
    
    //Quel est le titre du poste?
    const jobTitle = document.createElement('p');
    jobTitle.className = 'job-title';  
      jobTitle.textContent = title
      
    //Quel est le nom de l'entreprise?
    const coName = document.createElement('p');
    coName.className = 'co-name';
    coName.textContent = company;
    
    //Où l'entreprise se situe-t-elle?
    const location = document.createElement('p');
    location.className = 'company-location';
    location.textContent = cLocation;
    
    detailLink.append(logoDiv, jobInfo, jobTitle, coName, location);
    jobItem.append(detailLink);
    jobList.appendChild(jobItem);
}