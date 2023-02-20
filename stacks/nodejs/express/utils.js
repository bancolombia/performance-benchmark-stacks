const express = require('express');
const {runner: {start}} = require('utils');

function loopRoute(path, fn) {
    const router = express.Router();
    router.get(path, async (req, res) => {
        const delay = req.query.delay ? parseInt(req.query.delay) : 0;
        const percentage = req.query.percentage ? parseInt(req.query.percentage) : 100;
        const times = await start(fn, percentage, delay);
        return res.json({status: 'OK', applied: times > 0, times});
    });
    return router;
}

module.exports = {loopRoute}
