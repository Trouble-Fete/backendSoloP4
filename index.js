require("dotenv").config();
const app = require("./src/app");

const port = process.env.PORT;

//get http://localhost: 4242/

app.get("/", (req, res) => {
	res.status(200).send("je suis sur l'api http://localhost: 4242/");
});

app.listen(port, (err) => {
	if (err) {
		console.error(err);
	} else {
		console.log(`server adress : http://localhost:${port}`);
	}
});
