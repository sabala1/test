import express from "express";
import { createInformation, getInformations } from "../controllers/information.js";

const router = express.Router();

//Create
router.post("/", createInformation);

//Get All
router.get("/", getInformations);


export default router;

