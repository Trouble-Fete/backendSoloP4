const { findAllWithRegions } = require("../model/rotationsModel");
const browse = async (req, res) => {
	try {
		const rotations = await findAllWithRegions();
		res.status(200).json(rotations);
	} catch (err) {
		res.sendStatus(500);
	}
};
// const read = (req, res) => {};

module.exports = { browse };
