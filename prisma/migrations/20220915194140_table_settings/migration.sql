/*
  Warnings:

  - You are about to drop the column `shoppingCartId` on the `User` table. All the data in the column will be lost.
  - Added the required column `shoppingCartId` to the `ShoppingCart` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_shoppingCartId_fkey";

-- AlterTable
ALTER TABLE "ShoppingCart" ADD COLUMN     "shoppingCartId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "shoppingCartId";

-- AddForeignKey
ALTER TABLE "ShoppingCart" ADD CONSTRAINT "ShoppingCart_shoppingCartId_fkey" FOREIGN KEY ("shoppingCartId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
