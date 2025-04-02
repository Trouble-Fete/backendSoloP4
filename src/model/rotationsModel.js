const db = require("./db");

const findAllWithRegions = async () => {
	try {
		const [rows] = await db.query(
			`SELECT
          ro.rotation_id,
          rFrom.region_name AS from_region_name,
          rTo.region_name AS to_region_name,
          ro.difficulty
      FROM rotations ro
      JOIN regions rFrom ON ro.from_region = rFrom.region_id
      JOIN regions rTo   ON ro.to_region = rTo.region_id`,
		);
		return rows;
	} catch (error) {
		console.error(error);
		throw error;
	}
};

module.exports = { findAllWithRegions };
