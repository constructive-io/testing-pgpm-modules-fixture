-- Revert: schemas/rls_public/tables/user_contacts/columns/id/alterations/alt0000000097 from pg

BEGIN;


ALTER TABLE "rls_public".user_contacts 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

