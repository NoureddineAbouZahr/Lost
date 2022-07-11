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
    items: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Item'
      }],
});
module.exports = mongoose.model('User', userSchema);