const {
    homeHandler,
    publicHandler,
    errorHandler,
    apartmentHandler,
    reserverApartmentHandler,
    getCities
  } = require('./handlers');
  
  const router = (request, response) => {
    const { url } = request;
  
    if (url === '/') {
      homeHandler(response);
    } else if (url.includes('public')) {
      publicHandler(url, response);
    } else if (url.includes('search')) {
      apartmentHandler(url, response);
    }else if (url.includes('reserverApartment')) {
      reserverApartmentHandler(request, response);
    }else if (url.includes('getCities')) {
      getCities(url, response);
    }else {
      errorHandler(response);
    }
  };
  
  module.exports = router;
  