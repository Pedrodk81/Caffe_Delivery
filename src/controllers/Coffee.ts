import { Express, Response, Request } from "express";
import { prisma } from "../database/prismaClient";

interface ICreateOrder {
  user_id: number;
  order_coffee_id: number;
  total: number;
}

export class CoffeesController {
  public static async listCoffees(_req: Request, res: Response) {
    const coffees = await prisma.coffee.findMany({
      include: { Coffee_category: { include: { category: true } } },
    });
    res.status(200).send(coffees);
  }

  public static async createOrder(
    { user_id, order_coffee_id, total }: ICreateOrder,
    res: Response,
    _req: Request
  ) {
    const order = await prisma.order.create({
      data: {
        user_id,
        order_coffee_id,
        total,
      },
    });
    res.status(200).send(order);
  }

  // public static async IncreaseTheAmountOfCoffees(res: Response, req: Request) {
  //   const addOrder = await prisma.order_coffee.findFirst({
  //     where: {
  //       order_coffee_id: {},
  //     },
  //   });
  // }
}
