DROP TABLE card_holder
DROP TABLE credit_card
DROP TABLE merchant
DROP TABLE merchant_category
DROP TABLE transactions

CREATE TABLE "card_holder" (
    "ch_id" SERIAL   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "ch_id"
     )
);

CREATE TABLE "credit_card" (
    "cc_card" VARCHAR   NOT NULL,
    "id_card_holder" INT   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "cc_card"
    )
);

CREATE TABLE "merchant" (
    "m_id" SERIAL   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "m_id"
     )
);

CREATE TABLE "merchant_category" (
    "mc_id" SERIAL   NOT NULL,
    "name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "mc_id"
     )
);

CREATE TABLE "transactions" (
    "t_id" SERIAL   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "t_card" VARCHAR   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_transactions" PRIMARY KEY (
        "t_id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_id_card_holder" FOREIGN KEY("id_card_holder")
REFERENCES "card_holder" ("ch_id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("mc_id");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_card" FOREIGN KEY("t_card")
REFERENCES "credit_card" ("cc_card");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("m_id");