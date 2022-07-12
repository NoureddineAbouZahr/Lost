const mongoose = require('mongoose');

const subCategoriesSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    }
});

const categorySchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    subCategories: [subCategoriesSchema],
});

module.exports = mongoose.model('Category', categorySchema);