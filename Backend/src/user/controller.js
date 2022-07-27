const { getUsers, getById, addUser, getByEmail } = require('./service');
const bcrypt = require('bcryptjs');
const TOKEN_SECRET = process.env.TOKEN_SECRET || "";
const jwt = require('jsonwebtoken');

async function get(req, res) {
  try {
    if (req.body.id) {
      const id = req.body.id;
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
async function login(req, res) {
  try {
    const user = await getByEmail(req.body.email);
    const validPassword = await bcrypt.compare(req.body.password, user.password);

    if (!user || !validPassword) return res.status(400).send('invalid credentials');

    const token = jwt.sign(
      { _id: user._id, name: user.name, email: user.email, phone: user.phone, role:user.role },
      TOKEN_SECRET
    );
    return res.header('auth-token', token).send(token);
  } catch (error) {
    console.log(error);
    
  }
}
module.exports = {
  get,
  register,
  login,
}