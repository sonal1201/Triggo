-- CreateTable
CREATE TABLE "ZapRunOutbox" (
    "id" TEXT NOT NULL,
    "zaprunsId" TEXT NOT NULL,

    CONSTRAINT "ZapRunOutbox_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ZapRunOutbox_zaprunsId_key" ON "ZapRunOutbox"("zaprunsId");

-- AddForeignKey
ALTER TABLE "ZapRunOutbox" ADD CONSTRAINT "ZapRunOutbox_zaprunsId_fkey" FOREIGN KEY ("zaprunsId") REFERENCES "Zapruns"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
