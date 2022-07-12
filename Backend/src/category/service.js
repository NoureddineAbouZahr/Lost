const Category = require('../../model/Category');

async function getCats(){
    return await Category.find();
}