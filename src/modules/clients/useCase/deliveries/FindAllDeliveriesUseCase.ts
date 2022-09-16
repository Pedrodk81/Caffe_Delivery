import { prisma } from "../../../../database/prismaClient";

export class FindAllDeliveriesUseCase {
  async execute(shoppingCartId: string) {
    const shoppingCard = await prisma.shoppingCart.findMany({
      where: {
        id: shoppingCartId,
      },
      select: {
        caffe: true,
        caffeId: true,
        User: true,
      },
    });

    return shoppingCard;
  }
}
