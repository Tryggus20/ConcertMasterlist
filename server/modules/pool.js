
// const pg = require('pg');
// let pool;

// // When our app is deployed to the internet 
// // we'll use the DATABASE_URL environment variable
// // to set the connection info: web address, username/password, db name
// // eg: 
// //  DATABASE_URL=postgresql://jDoe354:secretPw123@some.db.com/prime_app
// if (process.env.DATABASE_URL) {
//     pool = new pg.Pool({
//         connectionString: process.env.DATABASE_URL,
//         ssl: {
//             rejectUnauthorized: false
//         }
//     });
// }
// // When we're running this app on our own computer
// // we'll connect to the postgres database that is 
// // also running on our computer (localhost)
// else {
//     pool = new pg.Pool({
//         host: 'localhost',
//         port: 5432,
//         database: 'concert-masterlist',   // 	💥 Change this to the name of your database!
//     });
// }

// pool.on('connect', () => console.log("connected to postgres"))

// module.exports = pool;

const pg = require("pg");

let config = {};

if (process.env.DATABASE_URL) {
  config = {
    connectionString: process.env.DATABASE_URL,
  };
} else {
  config = {
    database: "concert_masterlist",
    host: "localhost",
    port: 5432,
    max: 10,
    idleTimeoutMillis: 30000,
  };
}

const pool = new pg.Pool(config);

pool.on("connect", () => console.log("Connected to postgres"));

pool.on("error", (err) => console.log("Error in connecting to postgres", err));

module.exports = pool;