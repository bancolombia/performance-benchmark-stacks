const {loopRoute} = require('../utils');
const hashService = require('../services/hash');

module.exports = function (fastify, opts, done) {
    loopRoute(fastify, '/hash', hashService);
  
    done();
  };
  