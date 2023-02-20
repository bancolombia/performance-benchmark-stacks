const fs = require('fs');
const path = require('path');

function init(app) {
    fs.readdirSync(path.resolve(__dirname, './routes'))
        .map(file => path.resolve(__dirname, './routes', file))
        .forEach(item => {
            console.log(`setting up routes ${item}`);
            app.register(require(item));
        });
}

module.exports = {init};
