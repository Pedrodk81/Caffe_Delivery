import { prisma } from "../../../../database/prismaClient";
import { hash } from "bcrypt";

interface ICreateClient {
  username: string;
  password: string;
}

export class CreateClientUseCase {
  async execute({ username, password }: ICreateClient) {
    const clientExist = await prisma.user.findFirst({
      where: {
        username: {
          equals: username,
          mode: "insensitive",
        },
      },
    });

    if (clientExist) {
      throw new Error("Client already exists");
    }

    //Criptografar senha
    const hashPassword = await hash(password, 10);

    const user = await prisma.user.create({
      data: { username, password: hashPassword },
    });

    return user;
  }
}
