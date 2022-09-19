import { Request, Response } from "express";
import { CreateDeliveryUseCase } from "./CreateDeliveryUseCase";

export class CreateDeliveryController {
  async execute(response: Response, request: Request) {
    const { caffeId } = request.body;
    const { shoppingCartId } = request;

    const createDeliveryUseCase = new CreateDeliveryUseCase();

    const delivery = await createDeliveryUseCase.execute({
      shoppingCartId,
      caffeId,
    });
    return response.json(delivery);
  }
}
