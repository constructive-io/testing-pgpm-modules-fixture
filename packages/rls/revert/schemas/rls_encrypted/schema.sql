-- Revert: schemas/rls_encrypted/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "rls_encrypted" CASCADE;
COMMIT;  

