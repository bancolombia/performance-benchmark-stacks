const {crypt} = require('utils');
const {v4} = require('uuid');

module.exports = async () => {
    const plain = v4();
    return crypt.encrypt(plain)
        .then(hashed => crypt.validate(plain, hashed));
}
