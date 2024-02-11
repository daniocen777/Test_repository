var mysql = require("./mysql_config").mysqlClient;

var functions = require("../utils/functions");

class ProductDataAccess {
    async selectAll() {
        let nameFunction = "[ProductDataAccess] selectAll";
        let query = "select * from products";
        try {
            let response = await mysql.query(query);
            return functions.okResponse("OK", 200, response);
        } catch (error) {
            console.log(error);
            return functions.errorResponse(`nameFunction: ${nameFunction} => ${error}`, error.errno);
        }
    }

    async create(product) {
        const { name, price, description } = product;
        let query = "INSERT INTO products (name, price, description) VALUES (?, ?, ?)";
        try {
            let response = await mysql.query(query, [name, price, description]);
            return functions.okResponse("OK", 201);
        } catch (error) {
            console.log(error);
            return functions.errorResponse(`nameFunction: ${create} => ${error}`, error.errno);
        }
    }

    async update(id, product) {
        // const { name, price, description } = product;
        // const productToUpdate = { name, price, description };
        const productToUpdate = product;
        let query = "UPDATE products SET ? WHERE id = ?";
        try {
            let response = await mysql.query(query, [productToUpdate, id]);
            return functions.okResponse("OK", 201, product);
        } catch (error) {
            console.log(error);
            return functions.errorResponse(`nameFunction: ${update} => ${error}`, error.errno);
        }
    }

    async findById(id) {
        let query = "SELECT id, name, price, description FROM products WHERE id = ?";
        try {
            let responnse = await mysql.query(query, [id]);
            if (responnse.length === 1) {
                return functions.okResponse("OK", 200, responnse);
            }
            return functions.errorResponse("El producto no existe", 404);
        } catch (error) {
            console.log(`ERRORORORORO => ${error}`);
            return functions.errorResponse(`nameFunction: ${update} => ${error}`, error.errno);
        }
    }

    async delete(id) {
        let query = "DELETE FROM products WHERE id = ?";
        try {
            let product = await this.findById(id);
            if ((product.obj != null) && (product.obj.length === 1)) {
                let responnse = await mysql.query(query, [id]);
                return functions.okResponse("OK", 200, product.obj);
            }
            return functions.errorResponse("El producto no existe", 404);
        } catch (error) {
            console.log(`ERRORORORORO => ${error}`);
            return functions.errorResponse(`nameFunction: ${update} => ${error}`, error.errno);
        }
    }
}

module.exports = ProductDataAccess.prototype;
