const db = require('./database');
const helper = require('../helpers');
const config = require('../config');

async function getMultiple(page = 1){
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(
        `SELECT * FROM courses LIMIT ${offset},${config.listPerPage}`
    );
    const data = helper.emptyOrRows(rows);
    const meta = {page};

    return {
        data,
        meta
    }
}
async function searchCourses(id){
    const rows = await db.callGetCourseById(id);
    const data = helper.emptyOrRows(rows);
    return {
        data
    }
}


module.exports = {
    getMultiple,
    searchCourses
}