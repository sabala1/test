import mongoose from "mongoose";

const { Schema } = mongoose;

const ImformationScema = new mongoose.Schema ({
    namelast:{
        type: String,
        required: true
    },
    phone:{
        type: String,
        required: true
    },
    address:{
        type: String,
        required: true
    }
});

export default mongoose.model("Information", ImformationScema);