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
        subid,
        user,
        extension
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
        subid,
        user,
        extension
    });
    return await item.save();
}
async function getItems(){
    return await Item.find().populate('subid')
}

async function getItemsbyUser(id){
    const u = await User.findById(id).populate('items');
    console.log(u);
    return u.items;
}
module.exports={
    addItem,
    getItems,
    getItemsbyUser,
}