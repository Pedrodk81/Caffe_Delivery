import { Express, Response, Request } from "express";
import { prisma } from "../database/prismaClient";
import { PrismaClient, Prisma } from '@prisma/client'
interface ICreateOrder {
  user_id: number;
  coffee_id: number;
  total: number;
}

export default class OrderController {
  public static async createOrder(
    req: Request,
    res: Response
  ) {
    const { id } = req.user;
    const { coffee_id, incremenet } = req.params;

    let order: Prisma.OrderCreateInput
    // order = await prisma.order.findFirst({ 
    //     where: {
    //       user_id: id,
    //       payment_at: null
    //     } 
    //   });

    let user = await prisma.user.findFirst({
      where: {
        id
      }
    })
    
    if(!order) {
      order = await prisma.order.create({ 
        data: {
          user_id: 1,
          Order_coffee: {
            coffee_id,
          }
        } 
      });
    }

    // const order = await prisma.order.create({
    //   data: {
    //     user_id,
    //     total,
    //   },
    // });

    res.status(200).send(order);
  }
}
