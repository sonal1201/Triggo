-- CreateTable
CREATE TABLE "Zapruns" (
    "id" TEXT NOT NULL,
    "zapId" INTEGER,

    CONSTRAINT "Zapruns_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Zapruns" ADD CONSTRAINT "Zapruns_zapId_fkey" FOREIGN KEY ("zapId") REFERENCES "Zap"("id") ON DELETE SET NULL ON UPDATE CASCADE;
