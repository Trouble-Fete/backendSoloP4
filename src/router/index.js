const express = require("express");

const router = express.Router();

const verdanskRouter = require("./verdanskRouter");

//http://localhost:4242/api/verdansk
router.use("/verdansk", verdanskRouter);

module.exports = router;
