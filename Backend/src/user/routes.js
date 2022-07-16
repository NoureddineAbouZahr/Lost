const { Router } = require('express');
const { get, register, login } = require('./controller');
const router = Router();

router.post('/register', register);
router.post('/login', login);
module.exports = router;

