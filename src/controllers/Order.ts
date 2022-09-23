import { Express, Response, Request } from "express";
import { prisma } from "../database/prismaClient";
import { PrismaClient, Prisma } from "@prisma/client";

interface ICreateOrder {
  user_id: number;
  order_coffee_id: number;
  total: number;
}

export default class OrderController {
  public static async createOrder(req: Request, res: Response) {
    const { id } = req.user;
    const { order_coffee_id, incremenet, user_id } = req.params;

    let user = await prisma.order.findFirst({
      where: {
        user_id: {
          equals: id,
        },
      },
    });
    if (!user) {
      const order = await prisma.order.create({
        data: {
          user_id: Number(user_id),
          order_coffee_id: Number(order_coffee_id),
        },
      });

      res.status(200).send(order);
    }

    // let order: Prisma.OrderCreateInput
    // // order = await prisma.order.findFirst({
    // //     where: {
    // //       user_id: id,
    // //       payment_at: null
    // //     }
    // //   });

    // let user = await prisma.user.findFirst({
    //   where: {
    //     id:id
    //   }
    // })

    // if(!order) {
    //   order = await prisma.order.create({
    //     data:{

    //     }
    //   })
    // order = await prisma.order.create({
    //   data: {
    //     user_id: 1,
    //     Order_coffee: {
    //       coffee_id,
    //     }
    //   }
    // });
    // }

    // const order = await prisma.order.create({
    //   data: {
    //     user_id,
    //     total,
    //   },
    // });
  }
}
