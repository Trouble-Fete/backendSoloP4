const db = require("./db");

// Fonction add pour ajouter une rotation :
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

// Fonction Browse pour récupérer toutes les rotations avec les noms des régions
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

// Fonction edit pour modifier une rotation existante :
const edit = async (rotation_id, rotation) => {
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

		// Mise à jour de la rotation dans la base de données
		const [result] = await db.query(
			"UPDATE rotations SET from_region = ?, to_region = ?, difficulty = ? WHERE rotation_id = ?",
			[from_region, to_region, difficulty, rotation_id],
		);

		return result.affectedRows;
	} catch (err) {
		console.error(err);
		throw err;
	}
};

// Fonction pour récupérer une rotation via son id, mais avec les noms
const findByIdWithRegions = async (rotation_id) => {
	try {
		const [rows] = await db.query(
			`SELECT
          ro.rotation_id,
          rFrom.region_name AS from_region_name,
          rTo.region_name AS to_region_name,
          ro.difficulty
      FROM rotations ro
      JOIN regions rFrom ON ro.from_region = rFrom.region_id
      JOIN regions rTo   ON ro.to_region = rTo.region_id
      WHERE ro.rotation_id = ?`,
			[rotation_id],
		);
		return rows[0];
	} catch (error) {
		console.error(error);
		throw error;
	}
};

module.exports = { add, findAllWithRegions, edit, findByIdWithRegions };
