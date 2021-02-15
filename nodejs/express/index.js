const express = require("express");
const app = express();

const port = process.env.PORT || 8080;

app.get('/status', (req, res) => {
    res.json({ status: 'UP' });
});

app.listen(port, () => {
    console.log(`Server started in port ${port}`);
});