-- AlterTable
ALTER TABLE "Category" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Coffee" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Coffee_category" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Order" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Order_coffee" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Payment_type" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "User_adrress" ALTER COLUMN "updated_at" DROP NOT NULL;
