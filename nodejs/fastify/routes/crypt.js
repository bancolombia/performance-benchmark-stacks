const {loopRoute} = require('../utils');
const cryptService = require('../services/crypt');

module.exports = function (fastify, opts, done) {
    loopRoute(fastify, '/crypt', cryptService);
  
    done();
  };
  