const mysql = require('mysql');
const Connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'games'
})

module.exports = Connection;
