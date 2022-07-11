const { getUsers, getById, addUser, getByEmail } = require('./service');
const bcrypt = require('bcryptjs');
const TOKEN_SECRET = process.env.TOKEN_SECRET || "";
const jwt = require('jsonwebtoken');

async function get(req, res) {
    try {
        if (req.query.id) {
            const id = req.query.id;
            const result = await getById(id);
            return res.send(result);
        }
        const result = getUsers();
        return res.send(result);
    } catch (error) {
        console.log(error);
    }
}
async function register(req, res) {
    try {
        const salt = await bcrypt.genSalt(10);
        const hashPassword = await bcrypt.hash(req.body.password, salt);
        const addUserResult = await addUser(req.body, hashPassword);
        return res.send({ user: addUserResult._id });
    } catch (error) {
        console.log(error);
    }
}