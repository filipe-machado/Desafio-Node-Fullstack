/*
  Warnings:

  - You are about to drop the column `authorId` on the `Evento` table. All the data in the column will be lost.
  - Added the required column `atualizadoEm` to the `Entrada` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dataEvento` to the `Evento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Evento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horario` to the `Evento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `localId` to the `Evento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome` to the `Evento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `atualizadoEm` to the `Local` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Entrada" ADD COLUMN     "atualizadoEm" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Evento" DROP COLUMN "authorId",
ADD COLUMN     "dataEvento" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "horario" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "localId" INTEGER NOT NULL,
ADD COLUMN     "nome" TEXT NOT NULL,
ADD COLUMN     "telefone" TEXT,
ADD COLUMN     "tipo" "Tipo" NOT NULL DEFAULT 'FUTEBOL';

-- AlterTable
ALTER TABLE "Local" ADD COLUMN     "atualizadoEm" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- CreateTable
CREATE TABLE "Catraca" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "localId" INTEGER NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Catraca_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Catraca" ADD CONSTRAINT "Catraca_localId_fkey" FOREIGN KEY ("localId") REFERENCES "Local"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Evento" ADD CONSTRAINT "Evento_localId_fkey" FOREIGN KEY ("localId") REFERENCES "Local"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
