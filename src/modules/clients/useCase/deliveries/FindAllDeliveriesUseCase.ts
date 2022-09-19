import { prisma } from "../../../../database/prismaClient";

interface IFindALlDEliveries {
  user_id: string;
  order_coffee: string;
}

export class FindAllDeliveriesUseCase {
  async execute(user_id: string) {
    const order = await prisma.order.findMany({
      where: {
        user_id: user_id,
      },
      select: {
        order_coffee_id: true,
      },
    });

    return order;
  }
}
