-- Revert: schemas/users_simple_secrets/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "users_simple_secrets" CASCADE;
COMMIT;  

