-- Revert: schemas/rls_public/tables/organization_settings/alterations/alt0000000075 from pg

BEGIN;


ALTER TABLE "rls_public".organization_settings
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

