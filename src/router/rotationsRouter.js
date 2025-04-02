const express = require("express");
const db = require("../model/db");

const router = express.Router();

const { browse, addRotation } = require("../controller/rotationsController.js");

//get http://localhost:4242/api/rotations/
router.get("/", browse);

//POST http://localhost:4242/api/rotations/
router.post("/", addRotation);
module.exports = router;
