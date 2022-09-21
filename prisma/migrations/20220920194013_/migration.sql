/*
  Warnings:

  - You are about to drop the column `coffeeId` on the `Coffee_category` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Coffee_category" DROP CONSTRAINT "Coffee_category_coffeeId_fkey";

-- AlterTable
ALTER TABLE "Coffee_category" DROP COLUMN "coffeeId";

-- AddForeignKey
ALTER TABLE "Coffee_category" ADD CONSTRAINT "Coffee_category_coffee_id_fkey" FOREIGN KEY ("coffee_id") REFERENCES "Coffee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
