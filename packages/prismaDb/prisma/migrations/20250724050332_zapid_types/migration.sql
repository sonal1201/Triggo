/*
  Warnings:

  - The primary key for the `Zap` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `zapId` on table `Zapruns` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Action" DROP CONSTRAINT "Action_zapId_fkey";

-- DropForeignKey
ALTER TABLE "Trigger" DROP CONSTRAINT "Trigger_zapId_fkey";

-- DropForeignKey
ALTER TABLE "Zapruns" DROP CONSTRAINT "Zapruns_zapId_fkey";

-- AlterTable
ALTER TABLE "Action" ALTER COLUMN "zapId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Trigger" ALTER COLUMN "zapId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Zap" DROP CONSTRAINT "Zap_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Zap_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Zap_id_seq";

-- AlterTable
ALTER TABLE "Zapruns" ALTER COLUMN "zapId" SET NOT NULL,
ALTER COLUMN "zapId" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "Trigger" ADD CONSTRAINT "Trigger_zapId_fkey" FOREIGN KEY ("zapId") REFERENCES "Zap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Action" ADD CONSTRAINT "Action_zapId_fkey" FOREIGN KEY ("zapId") REFERENCES "Zap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Zapruns" ADD CONSTRAINT "Zapruns_zapId_fkey" FOREIGN KEY ("zapId") REFERENCES "Zap"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
