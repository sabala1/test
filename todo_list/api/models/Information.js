import mongoose from "mongoose";
const Schema = mongoose.Schema

const newSchema = new Schema({
    namelast:String,
    phone:String,
    address:String
})

export default mongoose.model("Information", newSchema);