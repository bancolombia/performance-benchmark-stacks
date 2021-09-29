const hash = require('./lib/hash');
const crypt = require('./lib/crypt');
const runner = require('./lib/delayed-task-runner');
const percentage = require('./lib/percentage');
const prime = require('./lib/prime');

module.exports = {crypt, hash, runner, percentage, prime}
