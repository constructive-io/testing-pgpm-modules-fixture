-- Revert: schemas/users_public/tables/users/columns/id/alterations/alt0000000007 from pg

BEGIN;


ALTER TABLE "users_public".users 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

