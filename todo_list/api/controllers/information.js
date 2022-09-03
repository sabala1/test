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

// export const getInformation = async (req, res, next) => {
//     try{
//         const information = await Information.findById(
//             req.params.id
//         );
//        res.status(200).json(information);
//     }catch(err){
//         next(err);
//     }
// }

export const getInformations = async (req, res, next) => {
    try{
        const informations = await Information.find();
        res.status(200).json(informations);
    }catch(err){
        next(err);
    }
}