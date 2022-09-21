/*
  Warnings:

  - The primary key for the `Order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Order` table. All the data in the column will be lost.
  - The `user_id` column on the `Order` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_order_id_fkey";

-- AlterTable
ALTER TABLE "Order" DROP CONSTRAINT "Order_pkey",
DROP COLUMN "id",
DROP COLUMN "user_id",
ADD COLUMN     "user_id" SERIAL NOT NULL,
ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("user_id");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
