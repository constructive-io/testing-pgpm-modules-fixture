-- Revert: schemas/users_private/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "users_private" CASCADE;
COMMIT;  

