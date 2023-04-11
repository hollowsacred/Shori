/*
  Warnings:

  - You are about to drop the column `belongs` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "belongs" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "belongs";
