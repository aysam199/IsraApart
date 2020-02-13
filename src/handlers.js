const { readFile } = require("fs");
const path = require("path");
const urlMod = require('url')
const dbConnection = require('./database/db_connection')
const querystring = require('querystring')
const pgFormat = require('pg-format')

const extension = {
    html: { "Content-Type": "text/html" },
    css: { "Content-Type": "text/css" },
    js: { "Content-Type": "application/javascript" },
    png: { "Content-Type": "image/png" },
    jpg: { "Content-Type": "image/jpg" },
    ico: { "Content-Type": "image/x-icon" },
    json: { "Content-Type": "application/json" },
    text: { "Content-Type": "text/plain" }
};

const serverError = (err, response) => {
    response.writeHead(500, extension.html);
    response.end("<h1>Sorry, there was a problem loading the page</h1>");
    console.log(err);
};


const homeHandler = response => {
    const filepath = path.join(__dirname, "..", "public", "index.html");
    readFile(filepath, (err, file) => {
        if (err) return serverError(err, response);
        response.writeHead(200, extension.html);
        response.end(file);
    });
};

//Search for available apartments based on city name and dates
const apartmentHandler = (url, response) => {
    const queries = querystring.parse(urlMod.parse(url).query);
    let cityNameInsensitive = createInsensitiveName(queries.city)
    let today = new Date();
    if(!checkYearValidity(queries,today)){
        response.end(JSON.stringify(['Invalid year']))
    }
    if(!checkDayValidity(queries,today)){
        response.end(JSON.stringify(['Less than today']))
    }
    let arrivalInputDate = parseInt((queries.arrival.split('-'))[2]);
    let departureInputDate = parseInt((queries.departure.split('-'))[2]);
    if(arrivalInputDate > departureInputDate) {
        response.end(JSON.stringify(['Invalid day']))
    }
    //---------------------------------------------To find how many days between selected dates
    var arrivalToDate = new Date(queries.arrival)
    var departToDate = new Date(queries.departure)
    //var Difference_In_Days =findHowManyDays(arrivalToDate,departToDate)
    //------------------------------------------------------------------------------------------

    let tempArrivalDate = buildDate(arrivalToDate)
    let tempDepartDate = buildDate(departToDate)
    //let numberOfRows = db.dbConnection.query('SELECT * FROM reservation INNER JOIN apartment ON reservation.apartment_id = apartment.id WHERE reservation.apartment_id = $1',[])
    let arrOfData =[cityNameInsensitive,tempArrivalDate,tempDepartDate, queries.guestcount]
    let rangeQuery=`SELECT apartment.name, apartment.id, contact_info FROM apartment     
        INNER JOIN reservation ON reservation.apartment_id = apartment.id     
        WHERE apartment.city_id IN (SELECT id FROM city WHERE name = $1) AND 
        apartment.capacity >= $4 AND apartment_id NOT IN
        (SELECT apartment_id FROM reservation WHERE 
        ($2 between  to_char(reservation.arriving_date,'YYYY-MM-DD')
        and to_char(reservation.leaving_date,'YYYY-MM-DD'))     
        OR     
        ($3 between to_char(reservation.arriving_date,'YYYY-MM-DD') 
        and to_char(reservation.leaving_date,'YYYY-MM-DD')) 
        OR 
        ($2 <  to_char(reservation.arriving_date,'YYYY-MM-DD') and
        $3 > to_char(reservation.leaving_date,'YYYY-MM-DD')))
        UNION
        SELECT apartment.name, apartment.id, contact_info FROM apartment WHERE id NOT IN (SELECT apartment_id FROM reservation) and 
        apartment.city_id IN (SELECT id FROM city WHERE name = $1) AND
        apartment.capacity >= $4`
    
    dbConnection.query(rangeQuery,arrOfData, (error, result) => {
    if (error) {
        console.log(error)
        response.writeHead(503, extension.text);
        return response.end('Server failed to load the apartments for that city. Please try again in few minutes.')
    }
    response.writeHead(200, extension.json);
    if(result===undefined || result==='' || result.length === 0){
        response.end([]);
    }
    response.end(JSON.stringify(result.rows));
    })

};

//Updates the reservation table to reserver apartment according to dates
const reserverApartmentHandler = (request, response) => {
        var allTheData = '';
        request.on('data', function (chunkOfData) {
            allTheData += chunkOfData;
        });
        request.on('end', function () {
        allTheData = JSON.parse(allTheData);
        const sqlQuery = pgFormat(`INSERT INTO reservation (apartment_id,arriving_date,leaving_date) 
        VALUES ($1,$2,$3)`)
        dbConnection.query(sqlQuery,[allTheData.apartmentID,allTheData.dayOfArrival,allTheData.dayOfDeparture]);
        response.writeHead(301, {"Location": "/"});
        response.end();
  });
};


const publicHandler = (url, response) => {
    const filepath = path.join(__dirname, "..", url);
    const fileExt = url.split('.')[1]

    readFile(filepath, (err, file) => {
        if (err) return serverError(err, response);

        response.writeHead(200, extension[fileExt]);
        response.end(file);
    });
};

const getCities = (url, response) => {
    dbConnection.query('SELECT name FROM city', (error, result) => {
    if (error) {
        console.log(error)
        response.writeHead(503, extension.text);
        return response.end('Server failed to load the cities. Try again soon.')
    }
    response.writeHead(200, extension.json);
    response.end(JSON.stringify(result.rows));
    })
};


const errorHandler = response => {
    response.writeHead(404, extension.html);
    response.end("<h1>404 Page Requested Cannot be Found</h1>");
};



//helper functions---------------------------------------------------------------
function findHowManyDays(arrivalToDate,departToDate){
    var Difference_In_Time =departToDate.getTime() -arrivalToDate.getTime(); 
    var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24); 
    return Difference_In_Days;
}
function buildDate(date){
    var month =''+(date.getMonth()+1)
    var day = '' + (date.getDate())
    return [date.getFullYear()
        ,month.length<2?'0'+month:month
        ,day.length<2?'0'+day:day].join('-')
}
function checkYearValidity(queries,today){
    if(parseInt(queries.arrival.split('-')[0]) !== 
        parseInt(today.getFullYear()) || 
        parseInt(queries.departure.split('-')[0]) !== parseInt(today.getFullYear())){
        return false;
    }
    return true;
}
function checkDayValidity(queries,today){
    if(parseInt(queries.arrival.split('-')[2]) < 
        parseInt(today.getDate())){
            return false;
        }        
    return true;
}
function createInsensitiveName(name){
    return name.substring(0, 1).toUpperCase() +name.substring(1, name.length).toLowerCase()
}
Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}
//--------------------------------------------------------------------------------

module.exports = {
    homeHandler,
    publicHandler,
    errorHandler,
    apartmentHandler,
    reserverApartmentHandler,
    getCities
};