const tape = require("tape");
const runDbBuild = require("../src/database/db_build");
const getData = require("../src/queries/getData");
const postData = require("../src/queries/postData");
const {
  getAllData,
  getCityTable,
  getGuestTable,
  getApartmentTable,
  getReservationTable
} = require("../src/queries/getData");
tape("tape is working", t => {
  t.equals(1, 1, "one equals one");
  t.end();
});

tape("Can we get data?", t => {
  runDbBuild(function(error, result) {
    getCityTable((err, res) => {
      if (err) return err;
      t.equals(res[0].name, "Haifa", "First city in table should be Haifa");
    });

    getGuestTable((err, res) => {
      if (err) return err;
      t.equals(res[0].name, "Aysam", "First guest in table should be Aysam");
    });
    getApartmentTable((err, res) => {
      if (err) return err;
      t.equals(
        res[0].name,
        "Haifa Port",
        "Frist apartment in table should be Haifa Port"
      );
      getReservationTable((err, res) => {
        if (err) return err;
        t.equals(
          res[0]["apartment_id"],
          1,
          "First reservation apartment_id should be 1"
        );
        t.equals(
          res[0]["guest_id"],
          1,
          "First reservation guest_id should be 1"
        );
      });
    });

    t.end();
  });
});
