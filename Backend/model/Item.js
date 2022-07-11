const mongoose = require('mongoose');


const itemSchema=new mongoose.Schema({
name:{
    type:String,
    required:true,
},
SerialNumber:{
    type:String,
},
model:{
    type:String,
},
color:{
    type:String,
},
pic:{
    type:String,
},
brand:{
    type:String,
},
extraInfo:{
    type:String,
},
locationx:{
    type:Number,
    required:true,
},
locationy:{
    type:Number,
    required:true,
},
status:{
    type:Int,
},
subid:{
type:mongoose.Schema.Types.ObjectId,
ref:'Sub'
},
//uid

});
module.exports = mongoose.model('Item', itemSchema);