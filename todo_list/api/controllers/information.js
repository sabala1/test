import Information from "../models/Information.js";

export const createInformation = async (req, res, next) => {
    const newInformation = new Information(req.body);

    try{
        const savedInformation = await newInformation.save();
        res.status(200).json(savedInformation);
    }catch(err){
        next(err);
    }
}
