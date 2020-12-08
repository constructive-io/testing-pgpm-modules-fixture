-- Revert: schemas/users_public/alterations/alt0000000042 from pg

BEGIN;
COMMENT ON CONSTRAINT emails_owner_id_fkey ON "users_public".emails IS NULL;
COMMIT;  

