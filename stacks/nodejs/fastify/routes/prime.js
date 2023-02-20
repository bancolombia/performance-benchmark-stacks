const primeService = require('../services/prime');
const {runner: {start}} = require('utils');

module.exports = function (fastify, opts, done) {
    //loopRoute(fastify, '/prime/:top', primeService);
    fastify.get('/prime/:top', async (req, res) => {
            const delay = req.query.delay ? parseInt(req.query.delay) : 0;
            const percentage = req.query.percentage ? parseInt(req.query.percentage) : 100;
            const top = req.params.top;
            const times = await start(() => primeService(top), percentage, delay);
            return res.send({status: 'OK', applied: times > 0, times});
        });
    done();
  };




















