import mysql from'mysql2/promise'
import config from '../config.js';

async function query(sql, params) {
    const connection = await mysql.createConnection(config.db);
    const [results, ] = await connection.execute(sql, params);

    return results;
}
async function callGetCourseById(id) {
    const connection = await mysql.createConnection(config.db);
    const [results, ] = await connection.query('CALL GetCourseById('+id+')');

    return results;
}
export default {
    query,
    callGetCourseById
}
