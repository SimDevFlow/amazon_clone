import express from "express";

const authRouter = express.Router();

authRouter.post('/api/signup',(response,request)=>{
    const {name,email,password} = response.body;
})

export{authRouter};