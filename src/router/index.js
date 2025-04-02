const express = require("express");

const router = express.Router();

const regionsRouter = require("./regionsRouter");

//http://localhost:4242/api/region
router.use("/region", regionsRouter);

module.exports = router;
