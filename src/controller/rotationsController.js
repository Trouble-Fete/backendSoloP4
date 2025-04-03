const {
	add,
	findAllWithRegions,
	edit,
	findByIdWithRegions,
	remove,
} = require("../model/rotationsModel");

const browse = async (req, res) => {
	try {
		const rotations = await findAllWithRegions();
		res.status(200).json(rotations);
	} catch (error) {
		res.sendStatus(500);
	}
};

const editRotation = async (req, res) => {
	const rotation_id = req.params.id;
	const { from_region_name, to_region_name, difficulty } = req.body;

	if (!from_region_name || !to_region_name || !difficulty) {
		return res.status(400).json({ message: "Tous les champs sont requis" });
	}

	try {
		const affectedRows = await edit(rotation_id, {
			from_region_name,
			to_region_name,
			difficulty,
		});
		if (affectedRows === 0) {
			return res.status(404).json({ message: "Rotation non trouvée" });
		}
		// Récupérer la rotation mise à jour
		const updatedRotation = await findByIdWithRegions(rotation_id);
		res.status(200).json(updatedRotation);
	} catch (error) {
		console.error(error);
		res.sendStatus(500);
	}
};

const addRotation = async (req, res) => {
	const { from_region_name, to_region_name, difficulty } = req.body;

	if (!from_region_name || !to_region_name || !difficulty) {
		return res.status(400).json({ message: "Tous les champs sont requis" });
	}

	try {
		const insertId = await add({
			from_region_name,
			to_region_name,
			difficulty,
		});
		res.status(201).json({
			rotation_id: insertId,
			from_region_name,
			to_region_name,
			difficulty,
		});
	} catch (error) {
		console.error(error);
		res.sendStatus(500);
	}
};

const deleteRotation = async (req, res) => {
	const rotation_id = req.params.id;
	try {
		const affectedRows = await remove(rotation_id);
		if (affectedRows === 0) {
			return res.status(404).json({ message: "Rotation non trouvée" });
		}
		res.sendStatus(204);
	} catch (error) {
		console.error(error);
		res.sendStatus(500);
	}
};

module.exports = { browse, addRotation, editRotation, deleteRotation };
