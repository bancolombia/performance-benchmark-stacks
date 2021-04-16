'use strict';

const cryptojs = require("crypto-js");

function sha256(clear) {
    return cryptojs.SHA256(clear).toString(cryptojs.enc.Hex);
}

module.exports = {sha256}
