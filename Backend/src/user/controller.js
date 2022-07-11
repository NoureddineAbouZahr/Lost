const { getUsers, getById, addUser, getByEmail}= require('./service');
const bcrypt= require('bcryptjs');
const TOKEN_SECRET = process.env.TOKEN_SECRET || "";
const jwt=require('jsonwebtoken');