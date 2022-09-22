import { Response, Request } from "express";
import { prisma } from "../database/prismaClient";
import { compare } from "bcrypt";
import { sign } from "jsonwebtoken";

interface ILoginUser {
  email: string;
  password: string;
}

export default class AuthController {
    public static async login(req: Request, res: Response) {
        const { email, password}: ILoginUser = req.body

        const user = await prisma.user.findFirst({
            where: {
              email,
            },
        });
      
        if (!user) throw new Error("Email or password invalid!");
        
        const passwordMatchs = await compare(password, user.password);
      
        if (!passwordMatchs) throw new Error("Email or password invalid!");
          
      
        const token = sign(
            { username: email },
            "99b7f9923dbc89864dc56105275cde09",
            {
                expiresIn: "1d",
                subject: JSON.stringify(user),
            },
        );

        res.status(200).send(
            {
                user,
                token
            }
        );
    }
}