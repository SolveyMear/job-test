// Gestion du DOM de la page 2

function displayJobDetails(response){

const logo = document.querySelector('.co-logo-div');
  logo.style.backgroundColor = response.logoBackground;
  const logoSVG = document.createElement('img');
    logoSVG.className = 'img-logo'
    logoSVG.setAttribute('alt', '');
    logoSVG.setAttribute('src', 'https://ecf-dwwm.cefim-formation.org/static/logo/' + id + '.svg')

    logo.appendChild(logoSVG);

  let compName = response.company;
  const name = document.querySelector('.name');
    name.textContent = compName;

// Pour afficher l'adresse du site de la boîte comme sur la maquette j'ai utilisé une regex
  const website = document.querySelector('.website');
    website.textContent = compName.toLowerCase().replace(/[\s.]/g, "") + ".com"

  const webLink = document.querySelector('.web-link');
    const link = document.createElement('a');
    link.setAttribute('href', 'https://theuselessweb.com/');
    link.classList.add('btn1', 'secondary-button', 'link');
      link.innerHTML = compName + ' Site';
      webLink.appendChild(link);

// Gestion de la conversion du timestamp dans le fichier timeStamp.js
  const timeStamp = document.querySelector('.time-stamp');
  const calcTime = timeSincePosted(response.postedAt)
    timeStamp.textContent = calcTime

  const contract = document.querySelector('.contract-type');
    contract.textContent = response.contract;

  const title = document.querySelector('.job-title');
    title.textContent = response.position;

  const companyLocation = document.querySelector('.location');
    companyLocation.textContent = response.location;

  const description = document.querySelector('.description');
    description.textContent = response.description;
  
  const requirements = document.querySelector('.requirements');
    requirements.textContent = response.requirements.content;

    const requirementsList = document.querySelector('.requirements-list');

      for(let i=0; i < response.requirements.items.length; i++){
        let requirementsItem = document.createElement('li');
          requirementsItem.className ='ul-item'
          
          requirementsList.appendChild(requirementsItem);

        const item = document.createElement('p');
          item.className = 'item'
          item.innerHTML = response.requirements.items[i]
          
          requirementsItem.appendChild(item);

        let bulletPoint = document.createElement('span');
          bulletPoint.className = 'ul-list-style'
          
          requirementsItem.prepend(bulletPoint)
    }

  const role = document.querySelector('.role');
    role.textContent = response.role.content;

    const roleList = document.querySelector('.role-list')

      for(let i=0; i < response.role.items.length; i++){
        let roleItem = document.createElement('li');
          roleItem.className ='ol-item'

        roleList.appendChild(roleItem);

          const item = document.createElement('p');
            item.className = 'item'
            item.textContent = response.role.items[i]

            roleItem.appendChild(item);

          let number = document.createElement('span');
          number.className = 'ol-list-style'
          number.textContent = i + 1
          
          roleItem.prepend(number)
    }

  const jobName = document.querySelector('.job-name');
    jobName.textContent = response.position;
    
  const companyName = document.querySelector('.company-name');
    companyName.textContent = response.company;

}