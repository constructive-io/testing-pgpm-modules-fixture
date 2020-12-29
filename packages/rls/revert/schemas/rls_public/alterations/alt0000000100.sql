-- Revert: schemas/rls_public/alterations/alt0000000100 from pg

BEGIN;
COMMENT ON COLUMN "rls_public".user_contacts.device IS NULL;
COMMIT;  

