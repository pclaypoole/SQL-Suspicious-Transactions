CREATE TABLE "card_holder" (
    "id" INT   NOT NULL,
    "name" VARCHAR   NOT NULL
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "id_card_holder" INT   NOT NULL
);

CREATE TABLE "merchant" (
    "id" INT   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "id_merchant_category" INT   NOT NULL
);

CREATE TABLE "merchant_category" (
    "id" INT   NOT NULL,
    "name" VARCHAR   NOT NULL
);

CREATE TABLE "transactions" (
    "id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" DECIMAL(10,2)   NOT NULL,
    "card" VARCHAR   NOT NULL,
    "id_merchant" INT   NOT NULL
);


ALTER TABLE "card_holder" ADD CONSTRAINT "fk_card_holder_id" FOREIGN KEY("id")
REFERENCES "credit_card" ("id_card_holder");

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_card" FOREIGN KEY("card")
REFERENCES "transaction" ("id_merchant");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "merchant" ("id");


