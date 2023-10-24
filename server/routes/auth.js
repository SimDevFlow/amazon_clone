import express from "express";
import { User } from "../models/user.js";

const authRouter = express.Router();
try {
    authRouter.post('/api/signup',async (request,response)=>{
        const {name,email,password} = request.body;
        const existingUser = await User.findOne({email});
        if (existingUser) {
            return response.status(400).json({msg:"user with similar account found"});
        }
        let user = new User({
            email,
            password,
            name
        });
        user = await user.save();
        response.send(user);
    
    })
} catch (error) {
    console.log(error.message);
}


export{authRouter};