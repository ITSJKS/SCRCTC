
var mysql = require('mysql2');

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database:"railwaydb",
  password: "Timepass@1"
});
module.exports = connection;
