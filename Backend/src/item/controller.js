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
        console.log('updateCategory =>', updateCategory);
        return res.status(200).send(newItem);
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}
async function get(req, res) {
    try {
        console.log(req.query);
        const result = await getItems();
        console.log('result =>', result);
        return res.send(result);
    } catch (error) {
        console.log(error);
    }
}

async function removeItem(req, res) {
    try {
        const item = await Item.findOne({ _id: req.query.id });

        const deleteResult = await item.remove();

        return res.send('item removed');
    }
    catch (error) {
        console.log(error);
    }
}