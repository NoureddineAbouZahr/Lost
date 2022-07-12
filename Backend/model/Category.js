const mongoose = require('mongoose');

/*const subCategoriesSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    }
});*/

const categorySchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    //subCategories: [subCategoriesSchema],
    subid:{
        type: mongoose.Schema.Types.ObjectId,
        ref:'Sub'
    },
});

module.exports = mongoose.model('Category', categorySchema);