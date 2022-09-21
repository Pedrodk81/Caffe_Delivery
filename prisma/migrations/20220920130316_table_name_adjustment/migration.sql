/*
  Warnings:

  - You are about to drop the column `coffe_id` on the `Order_coffee` table. All the data in the column will be lost.
  - You are about to drop the `Coffe` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Coffer_category` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `coffee_id` to the `Order_coffee` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Coffer_category" DROP CONSTRAINT "Coffer_category_category_id_fkey";

-- DropForeignKey
ALTER TABLE "Order_coffee" DROP CONSTRAINT "Order_coffee_coffe_id_fkey";

-- AlterTable
ALTER TABLE "Order_coffee" DROP COLUMN "coffe_id",
ADD COLUMN     "coffee_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Coffe";

-- DropTable
DROP TABLE "Coffer_category";

-- CreateTable
CREATE TABLE "Coffee" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "price" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Coffee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coffee_category" (
    "coffee_id" SERIAL NOT NULL,
    "category_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Coffee_category_pkey" PRIMARY KEY ("coffee_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Coffee_name_key" ON "Coffee"("name");

-- AddForeignKey
ALTER TABLE "Coffee_category" ADD CONSTRAINT "Coffee_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order_coffee" ADD CONSTRAINT "Order_coffee_coffee_id_fkey" FOREIGN KEY ("coffee_id") REFERENCES "Coffee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
