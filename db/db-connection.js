// db/db-connection.js
const mysql = require('mysql2');

// Create a connection pool (or a single connection)
const pool = mysql.createPool({
    host: 'localhost', // replace with your MySQL host
    user: 'root',      // replace with your MySQL user
    password: '',      // replace with your MySQL password
    database: 'product_tracking_db', // replace with your MySQL database name
});

// Use the promise API
const db = pool.promise();

module.exports = db;
