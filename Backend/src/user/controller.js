const { getUsers, getById, addUser, getByEmail}= require('./service');
const bcrypt= require('bcryptjs');
const TOKEN_SECRET = process.env.TOKEN_SECRET || "";
const jwt=require('jsonwebtoken');

async function get(req, res){
    try{
        if(req.query.id)
        {
            const id = req.query.id;
            const result= await getById(id);
            return res.send(result);
        }
        const result=getUsers();
        return res.send(result);
    }catch(error){
        console.log(error);
    }
}