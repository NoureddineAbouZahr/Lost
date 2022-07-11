const {addSub,getSubs}=require("./service");
const Sub=require("../../model/Sub");
const Category=require("../../model/Category");

async function add(req,res){
    try{
        const newSub=await addSub(req.body);
        const updateCategory=await Category.updateMany(
            {
                _id:newSub.cid
            },
            {
                $push:{
                    Subs:newSub._id
                }
            }
        );
        return res.status(200).send(newSub);
    }catch(error){
        console.log(error);
        res.status(500).send(error);
    }
}