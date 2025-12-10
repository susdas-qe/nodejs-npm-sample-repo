const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.send("Hello from nodejs app\n");
});

const port = 3000;

app.listen(port, () => {
    console.log(`Listening at http://0.0.0.0:${port}`);
});