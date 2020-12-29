-- Revert: schemas/rls_public/tables/user_settings/alterations/alt0000000081 from pg

BEGIN;


ALTER TABLE "rls_public".user_settings
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

