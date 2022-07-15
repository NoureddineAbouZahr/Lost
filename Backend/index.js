require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const corrs = require("cors");

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
