const express = require("express");
const db = require("../model/db");

const router = express.Router();

const { browse } = require("../controller/regionsController.js");
//get http://localhost:4242/api/regions/
router.get("/", browse);

module.exports = router;

// async (req, res) => {
// 	const [regions] = await db.query("select * from regions");
// 	res.send(regions);
// };
