const Item = require('../../model/Item');
const User = require('../../model/User');

async function addItem(body) {
    const {
        name,
        SerialNumber,
        model,
        color,
        pic,
        brand,
        extraInfo,
        locationx,
        locationy,
        status,
        sub,
        user,
    } = body;
    const item = new Item({
        name,
        SerialNumber,
        model,
        color,
        pic,
        brand,
        extraInfo,
        locationx,
        locationy,
        status,
        sub,
        user,
    });
    return await item.save();
}
async function getItems(){
    return await Item.find().populate('subCategories')
}

async function getItemsbyUser(id){
    const u = await User.findById(id).populate('Items');
    return u.items;
}
module.exports={
    addItem,
    getItems,
    getItemsbyUser,
}