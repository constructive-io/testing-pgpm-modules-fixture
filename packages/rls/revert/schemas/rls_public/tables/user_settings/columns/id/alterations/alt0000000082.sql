-- Revert: schemas/rls_public/tables/user_settings/columns/id/alterations/alt0000000082 from pg

BEGIN;


ALTER TABLE "rls_public".user_settings 
    ALTER COLUMN id DROP NOT NULL;


COMMIT;  

