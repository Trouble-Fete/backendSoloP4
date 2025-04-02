const { findAll } = require("../model/weaponsModel");
const browse = async (req, res) => {
	try {
		const weapons = await findAll();
		res.status(200).json(weapons);
	} catch (err) {
		res.sendStatus(500);
	}
};
// const read = (req, res) => {};

module.exports = { browse };
