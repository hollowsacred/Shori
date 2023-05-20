-- CreateTable
CREATE TABLE "PickPoint" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "streetNumber" TEXT NOT NULL,
    "longitude" INTEGER NOT NULL,
    "latitude" INTEGER NOT NULL,

    CONSTRAINT "PickPoint_pkey" PRIMARY KEY ("id")
);
