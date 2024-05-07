//Fonction pour convertir le time stamp récupéré par la requête API en une durée 
//Je me suis lourdement inspirée de ChatGPT pour celle là... et je ne regrette rien!

function timeSincePosted(param) {

  const timeDiff = new Date() - new Date(param);
  const minuteInMs = 1000 * 60;
  const hourInMs = minuteInMs * 60;
  const dayInMs = hourInMs * 24;
  const weekInMs = dayInMs * 7;
  const monthInMs = dayInMs * 30;
  const yearInMs = dayInMs * 365;
  
    if (timeDiff < minuteInMs) {
      return Math.floor(timeDiff / 1000) + 's ago';
  } else if (timeDiff < hourInMs) {
      return Math.floor(timeDiff / minuteInMs) + 'm ago';
  } else if (timeDiff < dayInMs) {
      return Math.floor(timeDiff / hourInMs) + 'h ago';
  } else if (timeDiff < weekInMs) {
      return Math.floor(timeDiff / dayInMs) + 'd ago';
  } else if (timeDiff < monthInMs) {
      return Math.floor(timeDiff / weekInMs) + 'w ago';
  } else if (timeDiff < yearInMs) {
      return Math.floor(timeDiff / monthInMs) + 'mo ago';
  } else {
      return Math.floor(timeDiff / yearInMs) + 'y ago';
  }
}

