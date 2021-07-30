const express = require("express");
const app = express();
const mongoose = require("mongoose");
mongoose.connect("mongodb+srv://inventam123:inventam123@mernstack.giwle.mongodb.net/flutter?retryWrites=true&w=majority", {useNewUrlParser: true,useUnifiedTopology:true});
const connection = mongoose.connection;
connection.once("open", ()=>{
    console.log("MongoDb connected");
})
const userRoutes = require("./routes/user.js");
app.use(express.json())
app.use("/user", userRoutes);
const port  = process.env.port||5000;
app.route("/").get((req, res) =>res.json("your first rest api and this will display"));
app.listen(port, ()=>console.log("your server is running on port number 5000"));