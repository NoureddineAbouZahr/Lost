const { Router } = require('express');
const { add, get, removeItem, getbyUser } = require('./controller');
const router = Router();

router.post('/addItem', add);
router.get('/getItems', get);
router.get('/userItems', getbyUser);
router.delete('/removeItem', removeItem);

module.exports = router;