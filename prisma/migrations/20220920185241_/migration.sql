-- AlterTable
ALTER TABLE "Coffee_category" ADD COLUMN     "coffeeId" INTEGER;

-- AddForeignKey
ALTER TABLE "Coffee_category" ADD CONSTRAINT "Coffee_category_coffeeId_fkey" FOREIGN KEY ("coffeeId") REFERENCES "Coffee"("id") ON DELETE SET NULL ON UPDATE CASCADE;
