const Category = require('../../model/Category');

async function getCats() {
    return await Category.find();
}


async function addCategory(body) {
    const {
        name,
    } = body;
    const cat = new Category({
        name,
    });
    return await cat.save();
}
module.exports={
    getCats,
    addCategory,
}