import { Request, Response } from "express";
import { CreateClientUseCase } from "./CreateClientUseCase";

export class CreateClientController {
  async handle(request: Request, response: Response) {
    const { email, password, first_name, last_name } = request.body;

    const createClientUseCase = new CreateClientUseCase();
    const result = await createClientUseCase.execute({
      email,
      password,
      first_name,
      last_name,
    });

    return response.json(result);
  }
}
