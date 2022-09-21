/*
  Warnings:

  - The primary key for the `Coffee_category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Order_coffee` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User_adrress` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Changed the type of `user_id` on the `Order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_order_coffee_id_fkey";

-- AlterTable
ALTER TABLE "Category" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Coffee" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Coffee_category" DROP CONSTRAINT "Coffee_category_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "coffee_id" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ADD CONSTRAINT "Coffee_category_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Coffee_category_coffee_id_seq";

-- AlterTable
ALTER TABLE "Order" ALTER COLUMN "updated_at" DROP DEFAULT,
DROP COLUMN "user_id",
ADD COLUMN     "user_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Order_coffee" DROP CONSTRAINT "Order_coffee_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "quantity" SET DEFAULT 1,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "order_id" DROP DEFAULT,
ADD CONSTRAINT "Order_coffee_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Order_coffee_order_id_seq";

-- AlterTable
ALTER TABLE "Payment_type" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "User_adrress" DROP CONSTRAINT "User_adrress_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "user_id" DROP DEFAULT,
ADD CONSTRAINT "User_adrress_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "User_adrress_user_id_seq";

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_order_coffee_id_fkey" FOREIGN KEY ("order_coffee_id") REFERENCES "Order_coffee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
