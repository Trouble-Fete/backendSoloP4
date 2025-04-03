const express = require("express");
const db = require("../model/db");

const router = express.Router();

const {
	browse,
	addRotation,
	editRotation,
	deleteRotation,
} = require("../controller/rotationsController.js");

//get http://localhost:4242/api/rotations/
router.get("/", browse);

//POST http://localhost:4242/api/rotations/
router.post("/", addRotation);

//PUT http://localhost:4242/api/rotations/
router.put("/:id", editRotation);

//DELETE http://localhost:4242/api/rotations/
router.delete("/:id", deleteRotation);

module.exports = router;
