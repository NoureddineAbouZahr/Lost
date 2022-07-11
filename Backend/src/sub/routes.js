const {Router}= require('express');
const {add,get}=require("./controller");
const router=Router();

router.post('/addSubCategory',add);
router.get('/getSubs?:id',get);

module.exports=router;