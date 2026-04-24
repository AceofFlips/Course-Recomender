import db from './database.js'
import helper from '../helpers.js'
import config from '../config.js'

async function getMultiple(page = 1){
    const offset = helper.getOffset(page, config.listPerPage);
    const rows = await db.query(
        `SELECT * FROM Courses LIMIT ${offset},${config.listPerPage}`
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


export default {
    getMultiple,
    searchCourses
}