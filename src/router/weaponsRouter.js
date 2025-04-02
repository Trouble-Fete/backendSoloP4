const express = require("express");
const db = require("../model/db");

const router = express.Router();

const { browse } = require("../controller/weaponsController.js");
//get http://localhost:4242/api/weapons/
router.get("/", browse);

module.exports = router;
