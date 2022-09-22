import { hash } from "bcrypt";
import { Request, Response } from "express";
import { prisma } from "../database/prismaClient";

interface ICreateUser {
  email: string;
  password: string;
  first_name: string;
  last_name: string;
}

export default class UserController {
  public static async createUser(
    req: Request,
    res: Response
    ) {
    const {first_name, last_name, email, password}: ICreateUser = req.body;

    const hasUser = await prisma.user.findFirst({
      where: {
        email: {
          equals: email,
          mode: "insensitive",
        },
      },
    });

    if (hasUser) {
      throw new Error("Email already exist ");
    }

    const hashPassword = await hash(password, 10);

    const userCreated = await prisma.user.create({
      data: {
        email,
        password: hashPassword,
        first_name,
        last_name,
      },
    });

    res.status(200).send(userCreated);
  }
}
