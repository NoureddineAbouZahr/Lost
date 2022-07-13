const mongoose = require('mongoose');


const subSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    cid: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Category'
    },
    items:[{
        type: mongoose.Types.ObjectId,
        ref: 'Item'
      }]
});
module.exports = mongoose.model('Sub', subSchema);