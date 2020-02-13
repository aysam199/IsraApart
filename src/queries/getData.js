const dbConnection = require("../database/db_connection");

const getAllData = cb => {
  getGuestTable(cb);
  getApartmentTable(cb);
  getReservationTable(cb);
  getCityTable(cb);
};

const getGuestTable = cb => {
  dbConnection.query("SELECT * FROM guest;", (err, res) => {
    if (err) return cb(err);

    cb(null, res.rows);
  });
};

const getApartmentTable = cb => {
  dbConnection.query("SELECT * FROM apartment;", (err, res) => {
    if (err) return cb(err);

    cb(null, res.rows);
  });
};

const getReservationTable = cb => {
  dbConnection.query("SELECT * FROM reservation;", (err, res) => {
    if (err) return cb(err);

    cb(null, res.rows);
  });
};

const getCityTable = cb => {
  dbConnection.query("SELECT * FROM city;", (err, res) => {
    if (err) return cb(err);

    cb(null, res.rows);
  });
};

module.exports = {
  getAllData,
  getCityTable,
  getGuestTable,
  getApartmentTable,
  getReservationTable
};
