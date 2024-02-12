const express = require("express");
const morgan = require("morgan");
const cors = require('cors');
require("dotenv").config();

const app = express();
const productRoutes = require("./routes/product_routes");

/* Settings */
app.use(express.json());
app.disable('etag');
app.use(cors());
app.set("port", process.env.PORT || 3001);
app.use(morgan("dev"));

/* Rutes */
app.use("/products", productRoutes);

app.listen(app.get("port"), () => {
    console.log("Server on Port", app.get("port"));
});