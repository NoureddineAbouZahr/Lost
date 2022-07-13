const { addItem, getItems, getItemsbyUser } = require('./service');
const Sub = require('../../model/Sub');
const Item = require('../../model/Item');

async function add(req, res) {
    try {
        const newItem = await addItem(req.body);
        const updateSub = await Sub.updateMany(
            {
                _id: newItem.subs
            },
            {
                $push: {
                    items: newItem._id
                }
            }
        );
        return res.status(200).send(newItem);
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}