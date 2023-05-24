-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "datePurchase" TIMESTAMP(3) NOT NULL,
    "dateDelivery" TIMESTAMP(3),
    "userId" INTEGER NOT NULL,
    "pickpointId" INTEGER,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_pickpointId_fkey" FOREIGN KEY ("pickpointId") REFERENCES "PickPoint"("id") ON DELETE SET NULL ON UPDATE CASCADE;
