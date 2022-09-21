import { compare } from "bcrypt";
import { sign } from "jsonwebtoken";
import { prisma } from "../../database/prismaClient";

interface IAuthenticateClient {
  email: string;
  password: string;
}

export class AuthenticationClientUseCase {
  async execute({ email, password }: IAuthenticateClient) {
    const client = await prisma.user.findFirst({
      where: {
        email,
      },
    });
    if (!client) {
      throw new Error("User name or password invalid");
    }

    const passwordMatch = await compare(password, client.password);

    if (!password) {
      throw new Error("User name or password invalid");
    }
    //gerar token
    const token = sign(
      { email },
      /*chave secreta (utilizei um md5 generator, 
        mas é tenho que perguntar para o aaron depois)*/
      "84dde50a5070e689f198651a3e27805f",
      {
        subject: client.email,
        expiresIn: "1d",
      }
    );

    return token;
  }
}
