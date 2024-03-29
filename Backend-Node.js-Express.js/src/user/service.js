const User = require('../../model/User');

async function getUsers() {
  return await User.find();
}
async function getById(id) {
  return await User.findById(id).populate('items');
}
async function addUser(body, hashPassword) {
  const {
    name,
    email,
    phone,
    role,
  } = body;

  const user = new User({
    name,
    email,
    phone,
    password: hashPassword,
    role
  });

  return await user.save();
}

async function getByEmail(email) {
  return await User.findOne({
    email
  });
}
module.exports = {
  getUsers,
  addUser,
  getById,
  getByEmail,
}