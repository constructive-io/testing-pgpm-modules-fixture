-- Revert: schemas/rls_public/tables/users/columns/id/alterations/alt0000000003 from pg

BEGIN;


ALTER TABLE "rls_public".users 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

