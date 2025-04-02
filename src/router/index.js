const express = require("express");

const router = express.Router();

const regionsRouter = require("./regionsRouter");

//http://localhost:4242/api/region
router.use("/regions", regionsRouter);

//http://localhost:4242/api/weapons
const weaponsRouter = require("./weaponsRouter");
router.use("/weapons", weaponsRouter);

//http://localhost:4242/api/weapons
const rotationsRouter = require("./rotationsRouter");
router.use("/rotations", rotationsRouter);

module.exports = router;
