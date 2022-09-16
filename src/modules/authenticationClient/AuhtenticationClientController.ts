import { Response, Request } from "express";
import { AuthenticationClientUseCase } from "./AuthenticationClientUseCase";

export class AuthenticationClientController {
  async handle(response: Response, request: Request) {
    const { username, password } = request.body;

    const authenticationClientUseCase = new AuthenticationClientUseCase();
    const result = await authenticationClientUseCase.execute({
      username,
      password,
    });

    return response.json(request);
  }
}
