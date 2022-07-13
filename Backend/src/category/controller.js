const { addCategory, getCats } = require('./service');
const Cat = require('../../model/Category');

async function add(req, res) {
    try {
        const newCat = await addCategory(req.body);

        return res.status(200).send(newCat);
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}
async function get(req, res) {
    try {
        const result = await getCats();
        return res.send(result);
    } catch (error) {
        console.log(error);
    }
}

