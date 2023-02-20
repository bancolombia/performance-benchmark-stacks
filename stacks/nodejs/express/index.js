const express = require("express");
const {init} = require('./setup');

const app = express();

const port = process.env.PORT || 8080;

init(app);

app.listen(port, () => {
    console.log(`Server started in port ${port}`);
});
