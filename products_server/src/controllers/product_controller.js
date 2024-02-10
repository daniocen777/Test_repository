const { request, response } = require("express");

const productDataAccess = require("../data/product_data_access");

class ProductController {
    async selectAll(req = request, res = response) {
        let result = await productDataAccess.selectAll();
        return res.status(result.status).json(result);
    }

    async create(req = request, res = response) {
        const product = req.body;
        let result = await productDataAccess.create(product);
        return res.status(result.status).json(result);
    }

    async update(req = request, res = response) {
        const { id } = req.params;
        const product = req.body;
        let result = await productDataAccess.update(parseInt(id), product);
        return res.status(result.status).json(result);
    }

    async findById(req = request, res = response) {
        const { id } = req.params;
        let result = await productDataAccess.findById(id);
        return res.status(result.status).json(result);
    }

    async delete(req = request, res = response) {
        const { id } = req.params;
        let result = await productDataAccess.delete(id);
        return res.status(result.status).json(result);
    }
}

module.exports = ProductController.prototype;
