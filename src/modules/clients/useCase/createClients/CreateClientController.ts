import { Request, Response } from "express";
import { CreateClientUseCase } from "./CreateClientUseCase";

export class CreateClientController {
  async handle(request: Request, response: Response) {
    const { email, password } = request.body;

    const createClientUseCase = new CreateClientUseCase();
    const result = await createClientUseCase.execute({
      email,
      password,
    });

    return response.json(result);
  }
}
