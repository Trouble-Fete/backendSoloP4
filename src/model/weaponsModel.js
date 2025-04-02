const db = require("./db");

const findAll = async () => {
	try {
		const [weapons] = await db.query("select * from weapons");
		return weapons;
	} catch (err) {
		console.error(err);
	}
};

module.exports = { findAll };
