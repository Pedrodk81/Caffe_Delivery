import { Request, Response } from "express";
import { CreateOrderUseCase } from "./CreateOrderUserCarse";

export class CreateDeliveryController {
  async execute(response: Response, request: Request) {
    const { order_coffee_id } = request.body;
    const { user_id } = request;

    const createOrderUseCase = new CreateOrderUseCase();

    const delivery = await createOrderUseCase.execute({
      order_coffee_id,
      user_id,
    });
    return response.json(delivery);
  }
}
