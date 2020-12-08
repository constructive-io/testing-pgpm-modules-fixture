-- Revert: schemas/users_encrypted_secrets/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "users_encrypted_secrets" CASCADE;
COMMIT;  

