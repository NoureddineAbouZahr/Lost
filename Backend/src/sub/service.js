const Sub = require('../../model/Sub');
const Cat=require('../../model/Category');

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