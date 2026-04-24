import express from 'express'
import testData from '../services/testservice.js'
const router = express.Router();

/* GET programming languages. */
router.get('/', async function(req, res, next) {
    try {
        res.json(await testData.getMultiple(req.query.page));
    } catch (err) {
        console.error(`Error while getting test data `, err.message);
        next(err);
    }
});
router.get('/:id', async function(req, res, next) {
    try {
        res.json(await testData.searchCourses(req.params.id));
    } catch (err) {
        console.error(`Error while searching test data `, err.message);
        next(err);
    }
});

export default router;