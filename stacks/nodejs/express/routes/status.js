const router = require('express').Router();

router.get('/status', (req, res) => {
    res.json({status: 'UP'});
});

module.exports = router;
