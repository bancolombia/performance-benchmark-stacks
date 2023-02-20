const bcrypt = require('bcrypt');

function encrypt(plain) {
    return bcrypt.hash(plain, 10);
}

function validate(plain, encrypted) {
    return bcrypt.compare(plain, encrypted);
}

module.exports = {encrypt, validate};
