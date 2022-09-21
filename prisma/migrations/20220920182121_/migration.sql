/*
  Warnings:

  - You are about to drop the column `order_id` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_order_id_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "order_id",
ADD COLUMN     "orderId" INTEGER;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;
