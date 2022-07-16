require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const userRouter = require("./src/user/routes");
const subRouter = require("./src/sub/routes");
const catRouter = require("./src/category/routes");
const itemRouter = require("./src/item/routes");

const DB_CONNECT = process.env.DB_CONNECT || "";
mongoose.connect(
    DB_CONNECT,
    () => console.log("connected")
);
const app = express();
app.use(express.json());
app.use(cors());

app.use("/api/users",userRouter);
app.use("/api/subs",subRouter);
app.use("/api/categories",catRouter);
app.use("/api/items",itemRouter);

app.listen(3001,()=>console.log('Server is running'));