const {runner: {start}} = require('utils');

function loopRoute(fastify, path, fn) {
    fastify.get(path, async (req, res) => {
        const delay = req.query.delay ? parseInt(req.query.delay) : 0;
        const percentage = req.query.percentage ? parseInt(req.query.percentage) : 100;
        const times = await start(fn, percentage, delay);
        return res.send({status: 'OK', applied: times > 0, times});
    });
}

module.exports = {loopRoute}
