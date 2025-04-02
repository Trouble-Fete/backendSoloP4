const express = require("express");
const db = require("../model/db");

const router = express.Router();

const { browse } = require("../controller/rotationsController.js");
//get http://localhost:4242/api/rotations/
router.get("/", browse);

module.exports = router;
