const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
    },
    phone: {
        type: String,
        min: 7,
        unique: true,
    },
    password: {
        type: String,
        required: true,
        min: 8,
        max: 1024,
    },
});
module.exports = mongoose.model('User', userSchema);