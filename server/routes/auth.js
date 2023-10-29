import express from "express";
import encrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { User } from "../models/user.js";

const authRouter = express.Router();
try {
  authRouter.post("/api/signup", async (request, response) => {
    const { name, email, password } = request.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return response
        .status(400)
        .json({ msg: "user with similar account found" });
    }
    const hashPassword = await encrypt.hash(password, 8);
    let user = new User({
      email,
      password: hashPassword,
      name,
    });
    user = await user.save();
    response.json(user);
  });
} catch (e) {
  response.status(500).json({ error: e.message });
}

try {
  authRouter.post("/api/signin", async (request,response) => {
    const { password, email } = request.body;
    const user = await User.findOne({ email });
    if (!user) {
      return response.status(400).json({ msg: "No user found" });
    }
    const isMatch = await encrypt.compare(password, user.password);
    if (!isMatch) {
      return response.status(400).json({ msg: "Password invalid" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    response.json({ token, ...user._doc });
  });
} catch (e) {
  response.status(500).json({ error: e.message });
}

export { authRouter };
