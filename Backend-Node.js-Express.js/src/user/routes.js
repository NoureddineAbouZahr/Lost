const { Router } = require('express');
const { get, register, login } = require('./controller');
const router = Router();

router.post('/register', register);
router.post('/login', login);
router.post('/get', get);
module.exports = router;

