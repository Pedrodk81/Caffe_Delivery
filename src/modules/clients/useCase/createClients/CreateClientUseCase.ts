import { prisma } from "../../../../database/prismaClient";
import { hash } from "bcrypt";

interface ICreateClient {
  email: string;
  password: string;
  first_name: string;
  last_name: string;
}

export class CreateClientUseCase {
  async execute({ email, password, first_name, last_name }: ICreateClient) {
    const userExist = await prisma.user.findFirst({
      where: {
        email: {
          equals: email,
          mode: "insensitive",
        },
      },
    });
    if (userExist) {
      throw new Error("Client already exist");
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
    return client;
  }
}
