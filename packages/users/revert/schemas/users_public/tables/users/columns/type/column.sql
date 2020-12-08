-- Revert: schemas/users_public/tables/users/columns/type/column from pg

BEGIN;


ALTER TABLE "users_public".users DROP COLUMN type;
COMMIT;  

