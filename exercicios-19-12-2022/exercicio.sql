CREATE DATABASE "bank";

CREATE TABLE "custommers" (
	"id" serial PRIMARY KEY,
	"fullName" TEXT NOT NULL,
    "cpf" integer UNIQUE NOT NULL,
  	"email" TEXT UNIQUE NOT NULL,
  	"password" TEXT NOT NULL
  );
  
CREATE TABLE "bankAccounts" (
  	"id" serial PRIMARY KEY,
  	"accountNumber" integer UNIQUE NOT NULL,
  	"agency" integer NOT NULL,
  	"openDate" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
  	"closeDate" TIMESTAMP WITHOUT TIMEZONE,
  	"custommerId" integer NOT NULL
  );
  
CREATE TABLE "transactions" (
  	"id" serial PRIMARY KEY,
  	"amount" integer NOT NULL,
  	"type" TEXT NOT NULL,
  	"time" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
  	"description" TEXT,
  	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE,
  	"bankAccountId" integer NOT NULL
  );
  
CREATE TABLE "creditCards" (
  	"id" serial PRIMARY KEY,
  	"name" TEXT NOT NULL,
  	"number" integer UNIQUE NOT NULL,
  	"securityCode" integer NOT NULL,
  	"expirationMonth" integer NOT NULL,
  	"expirationYear" integer NOT NULL,
  	"password" integer NOT NULL,
  	"limit" integer NOT NULL,
  	"bankAccountId" integer NOT NULL
  );
  
CREATE TABLE "custommerPhones" (
  	"id" serial PRIMARY KEY,
  	"number" integer UNIQUE NOT NULL,
  	"type" TEXT NOT NULL,
  	"custommerId" integer NOT NULL
  );
  
CREATE TABLE "states" (
  	"id" serial PRIMARY KEY,
  	"name" TEXT NOT NULL
);


CREATE TABLE "cities" (
  	"id" serial PRIMARY KEY,
  	"name" TEXT NOT NULL,
  	"stateId" integer NOT NULL
);


CREATE TABLE "custommerAdresses" (
  	"id" serial PRIMARY KEY,
  	"street" TEXT NOT NULL,
  	"number" integer NOT NULL,
  	"complement" TEXT NOT NULL,
  	"postalCode" integer NOT NULL,
  	"cityId" integer NOT NULL,
  	"custommerId" integer UNIQUE NOT NULL
);

ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("mainAddressId") REFERENCES "addresses"("id");

ALTER TABLE "bankAccounts" ADD CONSTRAINT "bankAccounts_fk0" FOREIGN KEY ("custommerId") REFERENCES "custommers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAcccountId") REFERENCES "bankAccounts"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccounts"("id");

ALTER TABLE "custommerPhones" ADD CONSTRAINT "custommerPhones_fk0" FOREIGN KEY ("custommerId") REFERENCES "custommers"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "custommerAdresses" ADD CONSTRAINT "custommerAdresses_fk0" FOREIGN KEY ("custommerId") REFERENCES "custommers"("id");
ALTER TABLE "custommerAdresses" ADD CONSTRAINT "custommerAdresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");