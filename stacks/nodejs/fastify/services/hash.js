const {hash: {sha256}} = require('utils');
const {v4} = require('uuid');

module.exports = () => sha256(v4());
