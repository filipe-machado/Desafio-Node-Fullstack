-- CreateEnum
CREATE TYPE "event_types" AS ENUM ('SHOW', 'SOCCER');

-- CreateEnum
CREATE TYPE "place_types" AS ENUM ('STADIUM', 'THEATER');

-- CreateEnum
CREATE TYPE "uf" AS ENUM ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO');

-- CreateTable
CREATE TABLE "places" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "nickname" TEXT,
    "type" "place_types" NOT NULL DEFAULT 'STADIUM',
    "cnpj" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "uf" "uf" NOT NULL,
    "cep" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "complement" TEXT,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "places_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "entrances" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "place_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "entrances_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "turnstiles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "place_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "turnstiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "events" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" "event_types" NOT NULL DEFAULT 'SOCCER',
    "date_event" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "place_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "events_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "entrances_place_id_key" ON "entrances"("place_id");

-- CreateIndex
CREATE UNIQUE INDEX "turnstiles_place_id_key" ON "turnstiles"("place_id");

-- CreateIndex
CREATE UNIQUE INDEX "events_place_id_key" ON "events"("place_id");

-- AddForeignKey
ALTER TABLE "entrances" ADD CONSTRAINT "entrances_place_id_fkey" FOREIGN KEY ("place_id") REFERENCES "places"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "turnstiles" ADD CONSTRAINT "turnstiles_place_id_fkey" FOREIGN KEY ("place_id") REFERENCES "places"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_place_id_fkey" FOREIGN KEY ("place_id") REFERENCES "places"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
