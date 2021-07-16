// Requerimos mysql, dotenv, promisify
const mysql = require("mysql2");
require("dotenv").config();
const { promisify } = require("util");

// Hacemos conexion
const pool = mysql.createPool({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
  multipleStatements: true,
});

pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      console.error("Database connection was closed.");
    }
    if (err.code === "ER_CON_COUNT_ERROR") {
      console.error("Database has to many connections");
    }
    if (err.code === "ECONNREFUSED") {
      console.error("Database connection was refused");
    }
  }

  if (connection) {
    connection.release();
    console.log("DB is Connected");
  }
  
});

// Promisify Pool Querys
pool.query = promisify(pool.query);

module.exports = pool;
