-- Revert: schemas/rls_public/alterations/alt0000000074 from pg

BEGIN;
COMMENT ON CONSTRAINT addresses_owner_id_fkey ON "rls_public".addresses IS NULL;
COMMIT;  

