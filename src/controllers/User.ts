import { hash } from "bcrypt";
import { Request, Response } from "express";
import { prisma } from "../database/prismaClient";

interface ICreateUser {
  email: string;
  password: string;
  first_name: string;
  last_name;
}

export class UserController {
  public static async createUser(
    { email, password, first_name, last_name }: ICreateUser,
    res: Response,
    _req: Request
  ) {
    const userExist = await prisma.user.findFirst({
      where: {
        email: {
          equals: email,
          mode: "insensitive",
        },
      },
    });
    if (userExist) {
      throw new Error("Email already exist ");
    }

    const hashPassword = await hash(password, 10);

    const client = await prisma.user.create({
      data: {
        email,
        password: hashPassword,
        first_name,
        last_name,
      },
    });

    res.status(200).send(client);
  }
}
