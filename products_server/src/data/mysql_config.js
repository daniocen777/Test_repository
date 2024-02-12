var mysql = require("mysql");
const util = require("util");

const mysqlClient = mysql.createPool({
    connectionLimit: 20,
    host: "localhost",
    user: "example-user",
    password: "user-password",
    database: "mydb",
});

mysqlClient.getConnection((err, connection) => {
    if (err) {
        if (err.code === "ER_ACCESS_DENIED_ERROR") {
            console.error("Acceso a conexión MYSQL denegado");
        }
        if (err.code === "PROTOCOL_CONNECTION_LOST") {
            console.error("Conexión a MYSQL perdida");
        }
        if (err.code === "ECONNREFUSED") {
            console.error("Conexión MYSQL rechazada");
        }
    }

    if (connection) {
        connection.release(); // cuando se termine conexion, liberar
        console.log("Conexión MYSQL establecida OK");
    }

    return;
});


//Esto permite utilizar el await/async con mysql
mysqlClient.query = util.promisify(mysqlClient.query);
mysqlClient.getConnection = util.promisify(mysqlClient.getConnection);

module.exports = { mysqlClient };
