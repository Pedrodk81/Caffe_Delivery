/*
  Warnings:

  - The primary key for the `Category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Category` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Coffe` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Coffe` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Coffer_category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `categoryId` on the `Coffer_category` table. All the data in the column will be lost.
  - The `coffe_id` column on the `Coffer_category` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Order` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `payment_type_id` column on the `Order` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Order_coffee` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `order_id` column on the `Order_coffee` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Payment_type` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Payment_type` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `User_adrress` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `userId` on the `User_adrress` table. All the data in the column will be lost.
  - Added the required column `category_id` to the `Coffer_category` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `order_coffee_id` on the `Order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `coffe_id` on the `Order_coffee` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `order_id` on the `User` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Coffer_category" DROP CONSTRAINT "Coffer_category_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_order_coffee_id_fkey";

-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_payment_type_id_fkey";

-- DropForeignKey
ALTER TABLE "Order_coffee" DROP CONSTRAINT "Order_coffee_coffe_id_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_order_id_fkey";

-- DropForeignKey
ALTER TABLE "User_adrress" DROP CONSTRAINT "User_adrress_userId_fkey";

-- AlterTable
ALTER TABLE "Category" DROP CONSTRAINT "Category_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Coffe" DROP CONSTRAINT "Coffe_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Coffe_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Coffer_category" DROP CONSTRAINT "Coffer_category_pkey",
DROP COLUMN "categoryId",
ADD COLUMN     "category_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "coffe_id",
ADD COLUMN     "coffe_id" SERIAL NOT NULL,
ADD CONSTRAINT "Coffer_category_pkey" PRIMARY KEY ("coffe_id");

-- AlterTable
ALTER TABLE "Order" DROP CONSTRAINT "Order_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "payment_type_id",
ADD COLUMN     "payment_type_id" INTEGER,
DROP COLUMN "order_coffee_id",
ADD COLUMN     "order_coffee_id" INTEGER NOT NULL,
ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Order_coffee" DROP CONSTRAINT "Order_coffee_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "order_id",
ADD COLUMN     "order_id" SERIAL NOT NULL,
DROP COLUMN "coffe_id",
ADD COLUMN     "coffe_id" INTEGER NOT NULL,
ADD CONSTRAINT "Order_coffee_pkey" PRIMARY KEY ("order_id");

-- AlterTable
ALTER TABLE "Payment_type" DROP CONSTRAINT "Payment_type_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Payment_type_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "order_id",
ADD COLUMN     "order_id" INTEGER NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User_adrress" DROP CONSTRAINT "User_adrress_pkey",
DROP COLUMN "userId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "user_id" SERIAL NOT NULL,
ADD CONSTRAINT "User_adrress_pkey" PRIMARY KEY ("user_id");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_adrress" ADD CONSTRAINT "User_adrress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coffer_category" ADD CONSTRAINT "Coffer_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_order_coffee_id_fkey" FOREIGN KEY ("order_coffee_id") REFERENCES "Order_coffee"("order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_payment_type_id_fkey" FOREIGN KEY ("payment_type_id") REFERENCES "Payment_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order_coffee" ADD CONSTRAINT "Order_coffee_coffe_id_fkey" FOREIGN KEY ("coffe_id") REFERENCES "Coffe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
