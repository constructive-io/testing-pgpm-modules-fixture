-- Revert: schemas/users_public/tables/users/columns/id/column from pg

BEGIN;


ALTER TABLE "users_public".users DROP COLUMN id;
COMMIT;  

