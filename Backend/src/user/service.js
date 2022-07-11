const User = require('../../model/User');

async function getUsers(){
    return await User.find();
}
async function getById(id) {
    return await User.findById(id).populate('contacts');
  }