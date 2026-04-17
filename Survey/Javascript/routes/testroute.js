const express = require('express');
const router = express.Router();
const testData = require('../services/testservice');

/* GET programming languages. */
router.get('/', async function(req, res, next) {
    try {
        res.json(await testData.getMultiple(req.query.page));
    } catch (err) {
        console.error(`Error while getting test data `, err.message);
        next(err);
    }
});

module.exports = router;