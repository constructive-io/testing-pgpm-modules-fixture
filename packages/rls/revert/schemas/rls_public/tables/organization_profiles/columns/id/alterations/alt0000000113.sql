-- Revert: schemas/rls_public/tables/organization_profiles/columns/id/alterations/alt0000000113 from pg

BEGIN;


ALTER TABLE "rls_public".organization_profiles 
    ALTER COLUMN id DROP DEFAULT;

COMMIT;  

