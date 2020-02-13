const form = document.querySelector("form");
const cityName = document.querySelector("#cityInput");
const DOA = document.querySelector("#DOAInput");
const DOD = document.querySelector("#DODInput");
const apartmentsList = document.querySelector("#apartments-list");
var datalist = document.getElementById("json-datalist");
var errorMsg = '';

let currApartmentsID = [];

function request(url, cb) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
      cb(null, xhr.responseText);
    } else {
      cb("error", xhr.responseType);
    }
  };
  xhr.open("GET", url, true);
  xhr.send();
}

function updateDom(err, data) {
  if (err) {
    console.log(err);
  } else {
    var inputData = JSON.parse(data);
    displayData(inputData);
  }
}

function checkAvailability(inputData){
  if(inputData === undefined || inputData.length===0){
    errorMsg = 'Sorry! no apartments are available, try a different date or a different apartment.';
    return false;
  }else if(inputData[0]=='Invalid year'){
    errorMsg = 'Enter the current year.';
    return false;
  }else if(inputData[0]=='Invalid month'){
    errorMsg = 'Invalid month, enter current month';
    return false;
  }else if(inputData[0]=='Invalid day'){
    errorMsg = 'Invalid date, enter arrival date lower than departure date';
    return false;
  }else if(inputData[0]=='Less than today'){
    errorMsg = 'Invalid date, enter a date which is today or later.';
    return false;
  }
  return true
}


function displayData(inputData) {
  while (apartmentsList.firstChild) {
    apartmentsList.removeChild(apartmentsList.firstChild);
  }
  var availabilityFlag = checkAvailability(inputData)
  //if the apartment not available or the dates are invalid
  if(!availabilityFlag == true){
    noDataLi = document.createElement("div");
    noDataLi.className = "wrapper apartment-listing apartment-name";
    noDataLi.textContent = errorMsg;
    apartmentsList.appendChild(noDataLi);
    return;
  }
  //if the inputs are correct
  inputData.forEach(apartment => {
    var newLi = document.createElement("li");
    var newHeader = document.createElement("h2");
    var newButton = document.createElement("button")
    newButton.textContent = "Reserve";
    newHeader.textContent = 'Apartment: '+apartment.name+' , contact host: '+apartment.contact_info;
    currApartmentsID.push(apartment.id)
    newHeader.className = "apartment-name";
    newButton.className = "reserveButton ";
    newButton.id = apartment.id;
    newButton.addEventListener("click",(e)=>{
      toggleButton(e)
    })
    newLi.className = "wrapper apartment-listing";
    newLi.appendChild(newHeader);
    newLi.appendChild(newButton)
    apartmentsList.appendChild(newLi);
  });
}

document.addEventListener("submit", e => {
  const url =
    "/search?city=" +
    cityName.value +
    "&arrival=" +
    DOA.value +
    "&departure=" +
    DOD.value +
    "&guestcount="+
    guestCount.value;
  e.preventDefault();
  request(url, updateDom);
});

function toggleButton(e){
  axios.post('/reserverApartment', {
    apartmentID: e.target.id,
    dayOfArrival: DOA.value,
    dayOfDeparture: DOD.value    
  })
  .then(function (response) {
    window.location.href = "/public/res.html"
  })
  .catch(function (error) {
    console.log(error);
  });
}

function createDataSet(data) {
  var datalist = document.getElementById("json-datalist");
  while (datalist.firstChild) {
      datalist.removeChild(datalist.firstChild);
  }
  data.forEach(function(element) {
      var opt = document.createElement("option");
      opt.value = element;
      datalist.appendChild(opt);
  });
}

fetch("/getCities")
  .then(function(response) {
    return response.json();
  })
  .then(function(data) {
    var cityNames = data.map(function(obj) {
      return obj.name
    })
    createDataSet(cityNames);
  })
  .catch(function(error) {
    console.log(error);
  });