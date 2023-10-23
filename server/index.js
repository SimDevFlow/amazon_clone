import express from "express";
import { authRouter } from "./routes/auth.js";
import mongoose, { mongo } from "mongoose";

const app = express();
const port = 3000;
const db = "mongodb+srv://Simdev:Z8JTfzzcFDmop2lW@cluster0.uhhmjoh.mongodb.net/?retryWrites=true&w=majority"

app.use(authRouter);

mongoose
  .connect(db)
  .then(() => {
    console.log("connection Successful");  
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(port, () => {
  console.log(`exemple app listen on port ${port}`);
});
