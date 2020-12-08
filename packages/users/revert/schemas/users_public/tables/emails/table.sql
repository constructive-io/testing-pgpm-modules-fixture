-- Revert: schemas/users_public/tables/emails/table from pg

BEGIN;
DROP TABLE "users_public".emails;
COMMIT;  

