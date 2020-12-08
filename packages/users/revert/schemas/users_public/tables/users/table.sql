-- Revert: schemas/users_public/tables/users/table from pg

BEGIN;
DROP TABLE "users_public".users;
COMMIT;  

