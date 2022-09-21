-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_payment_type_id_fkey";

-- AlterTable
ALTER TABLE "Order" ALTER COLUMN "payment_type_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_payment_type_id_fkey" FOREIGN KEY ("payment_type_id") REFERENCES "Payment_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;
