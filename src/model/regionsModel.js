const db = require("./db");

const findAll = async () => {
	try {
		const [regions] = await db.query("select * from regions");
		return regions;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll };
