const User = require('../../model/User');

async function getUsers(){
    return await User.find();
}