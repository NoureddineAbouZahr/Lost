const { Router } = require('express');
const { add, get } = require("./controller");
const router = Router();

router.post('/addCategory', add);
router.get('/getCategories', get);

module.exports = router;