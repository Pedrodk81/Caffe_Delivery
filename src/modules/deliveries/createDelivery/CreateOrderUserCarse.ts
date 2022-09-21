import { prisma } from "../../../database/prismaClient";

interface ICreateClientOrder {
  user_id: number;
  order_coffee_id: number;
}

export class CreateOrderUseCase {
  async execute({ user_id, order_coffee_id }: ICreateClientOrder) {
    const Order = await prisma.order.create({
      data: {
        user_id,
        order_coffee_id,
      },
    });
    return Order;
  }
}
