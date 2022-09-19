import { prisma } from "../../../database/prismaClient";

interface IShoppingCartDelivery {
  caffeId: string;
  shoppingCartId: string;
}

export class CreateDeliveryUseCase {
  async execute({ caffeId, shoppingCartId }: IShoppingCartDelivery) {
    const delivery = await prisma.shoppingCart.create({
      data: {
        caffeId,
        shoppingCartId,
      },
    });
    return delivery;
  }
}
