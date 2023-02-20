const {loopRoute} = require('../utils');
const hashService = require('../services/hash');

module.exports = loopRoute('/hash', hashService);
