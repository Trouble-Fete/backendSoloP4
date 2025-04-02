const db = require("./db");

const add = async (rotation) => {
	try {
		const { from_region_name, to_region_name, difficulty } = rotation;

		const [[fromRegion]] = await db.query(
			"SELECT region_id FROM regions WHERE region_name = ?",
			[from_region_name],
		);

		const [[toRegion]] = await db.query(
			"SELECT region_id FROM regions WHERE region_name = ?",
			[to_region_name],
		);

		if (!fromRegion || !toRegion) {
			throw new Error("Un ou plusieurs noms de régions sont invalides.");
		}

		const from_region = fromRegion.region_id;
		const to_region = toRegion.region_id;

		const [result] = await db.query(
			"INSERT INTO rotations (from_region, to_region, difficulty) VALUES (?, ?, ?)",
			[from_region, to_region, difficulty],
		);
		return result.insertId;
	} catch (err) {
		console.error(err);
		throw err;
	}
};

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

module.exports = { add, findAllWithRegions };
