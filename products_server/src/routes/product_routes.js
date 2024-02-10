const { Router } = require("express");

const router = Router();
const productController = require("../controllers/product_controller");

router.get("/", productController.selectAll);
router.get("/:id", productController.findById);
router.post("/create", productController.create);
router.put("/update/:id", productController.update);
router.delete("/:id", productController.delete);

module.exports = router;
