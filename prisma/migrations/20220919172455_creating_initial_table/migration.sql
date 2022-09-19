/*
  Warnings:

  - You are about to drop the column `coffee_id` on the `Order_coffee` table. All the data in the column will be lost.
  - You are about to drop the column `address` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `city` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `reference` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `stete` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `zip_code` on the `User` table. All the data in the column will be lost.
  - Added the required column `order_coffee_id` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Made the column `payment_type_id` on table `Order` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `coffe_id` to the `Order_coffee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_id` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "order_coffee_id" TEXT NOT NULL,
ALTER COLUMN "payment_type_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "Order_coffee" DROP COLUMN "coffee_id",
ADD COLUMN     "coffe_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "address",
DROP COLUMN "city",
DROP COLUMN "number",
DROP COLUMN "reference",
DROP COLUMN "stete",
DROP COLUMN "street",
DROP COLUMN "zip_code",
ADD COLUMN     "order_id" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "User_adrress" (
    "userId" TEXT NOT NULL,
    "zip_code" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "reference" TEXT,
    "city" TEXT NOT NULL,
    "stete" TEXT NOT NULL,
    "street" TEXT NOT NULL,

    CONSTRAINT "User_adrress_pkey" PRIMARY KEY ("userId")
);

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_adrress" ADD CONSTRAINT "User_adrress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_order_coffee_id_fkey" FOREIGN KEY ("order_coffee_id") REFERENCES "Order_coffee"("order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_payment_type_id_fkey" FOREIGN KEY ("payment_type_id") REFERENCES "Payment_type"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order_coffee" ADD CONSTRAINT "Order_coffee_coffe_id_fkey" FOREIGN KEY ("coffe_id") REFERENCES "Coffe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
