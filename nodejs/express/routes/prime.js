const express = require('express');
const {runner: {start}} = require('utils');
const primeService = require('../services/prime');
const router = express.Router();

module.exports = router.get('/prime/:top', async (req, res) => {
        const delay = req.query.delay ? parseInt(req.query.delay) : 0;
        const percentage = req.query.percentage ? parseInt(req.query.percentage) : 100;
        const tope = req.params.top;
        const times = await start(() => primeService(tope), percentage, delay);
        return res.json({status: 'OK', applied: times > 0, times});
    });




