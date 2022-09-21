import { Response, Request } from "express";
import { AuthenticationClientUseCase } from "./AuthenticationClientUseCase";

export class AuthenticationClientController {
  async handle(response: Response, request: Request) {
    const { email, password } = request.body;

    const authenticationClientUseCase = new AuthenticationClientUseCase();
    const result = await authenticationClientUseCase.execute({
      email,
      password,
    });

    return response.json(request);
  }
}
