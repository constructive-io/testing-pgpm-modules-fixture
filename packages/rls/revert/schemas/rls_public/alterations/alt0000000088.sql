-- Revert: schemas/rls_public/alterations/alt0000000088 from pg

BEGIN;
COMMENT ON CONSTRAINT user_settings_user_id_key ON "rls_public".user_settings IS NULL;
COMMIT;  

