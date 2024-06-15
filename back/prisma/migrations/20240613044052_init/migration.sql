-- CreateEnum
CREATE TYPE "Tipo" AS ENUM ('SHOW', 'FUTEBOL');

-- CreateEnum
CREATE TYPE "UF" AS ENUM ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO');

-- CreateTable
CREATE TABLE "Local" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "apelido" TEXT,
    "tipo" "Tipo" NOT NULL DEFAULT 'FUTEBOL',
    "cnpj" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "uf" "UF" NOT NULL,
    "cep" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "complemento" TEXT,
    "email" TEXT NOT NULL,
    "telefone" TEXT,

    CONSTRAINT "Local_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Entrada" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "localId" INTEGER NOT NULL,

    CONSTRAINT "Entrada_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Evento" (
    "id" SERIAL NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" TIMESTAMP(3) NOT NULL,
    "authorId" INTEGER,

    CONSTRAINT "Evento_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Entrada" ADD CONSTRAINT "Entrada_localId_fkey" FOREIGN KEY ("localId") REFERENCES "Local"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
