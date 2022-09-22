import { Response, Request } from "express";
import { prisma } from "../database/prismaClient";

// interface ICreateOrder {
//   user_id: number;
//   order_coffee_id: number;
//   total: number;
// }

export class CoffeesController {
  public static async listCoffees(_req: Request, res: Response) {
    const coffees = await prisma.coffee.findMany({
      include: { Coffee_category: { include: { category: true } } },
    });

    res.status(200).send(coffees);
  }
}
