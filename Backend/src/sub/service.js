const Sub = require('../../model/Sub');
const Cat=require('../../model/Category');
const Category = require('../../model/Category');

async function addSub(body){
    const{
        name,
        cat,
    }=body;
    const sub = new Sub({
        name,
        cat,
    });
    return await contact.save();
}
async function getSubs(id){
    const c=await Category.findById(id).populate('Subs');
    return c.Subs;
}
module.exports={
    addSub,
    getSubs,
}