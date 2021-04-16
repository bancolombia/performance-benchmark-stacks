const {loopRoute} = require('../utils');
const cryptService = require('../services/crypt');

module.exports = loopRoute('/crypt', cryptService);
