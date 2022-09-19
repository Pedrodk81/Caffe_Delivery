import { prisma } from "../../../../database/prismaClient";
import { hash } from "bcrypt";

interface ICreateClient {
  email: string;
  password: string;
}

export class CreateClientUseCase {
  async execute({ email, password }: ICreateClient) {
    const clientExist = await prisma.user.findFirst({
      where: {
        first_name: {
          equals: email,
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
      data: {
        email,
        password: hashPassword,
      },
    });

    return user;
  }
}
