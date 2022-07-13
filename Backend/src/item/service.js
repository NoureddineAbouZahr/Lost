const Item = require('../../model/Item');

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