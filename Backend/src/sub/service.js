const Sub = require('../../model/Sub');
const Category = require('../../model/Category');

async function addSub(body){
    const{
        name,
        cid,
    }=body;
    const sub = new Sub({
        name,
        cid,
    });
    return await sub.save();
}
async function getSubs(id){
    const c=await Category.findById(id).populate('Subs');
    return c.Subs;
}
module.exports={
    addSub,
    getSubs,
}