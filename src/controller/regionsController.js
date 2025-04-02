const { findAll } = require("../model/regionsModel");
const browse = async (req, res) => {
	try {
		const regions = await findAll();
		res.status(200).json(regions);
	} catch (err) {
		res.sendStatus(500);
	}
};
// const read = (req, res) => {};

module.exports = { browse };
