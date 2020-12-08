-- Revert: schemas/users_public/schema from pg

BEGIN;


DROP SCHEMA IF EXISTS "users_public" CASCADE;
COMMIT;  

