const express = require("express");

const router = express.Router();

//get http://localhost:4242/api/verdansk/
router.get("/", (req, res) => {
	res.send("je suis sur la route /api/verdansk");
});

module.exports = router;
