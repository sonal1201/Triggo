/*
  Warnings:

  - Added the required column `metadeta` to the `Zapruns` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Zapruns" ADD COLUMN     "metadeta" JSONB NOT NULL;
