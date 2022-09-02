import express from "express";
import Information from "../models/Information.js";
import { createInformation, deleteInformation, getInformation, getInformations, updateInformation } from "../controllers/information.js";

const router = express.Router();

//Create
router.post("/", createInformation);

//Update
router.put("/:id", updateInformation);

//Delete
router.delete("/:id", deleteInformation);

//Get
router.get("/:id", getInformation);

//Get All
router.get("/", getInformations);


export default router;