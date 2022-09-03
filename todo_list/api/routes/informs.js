import express from "express";
import { createInformation } from "../controllers/information.js";

const router = express.Router();

//Create
router.post("/", createInformation);


export default router;

