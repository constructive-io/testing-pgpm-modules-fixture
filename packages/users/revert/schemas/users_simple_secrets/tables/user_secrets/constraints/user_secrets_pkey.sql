-- Revert: schemas/users_simple_secrets/tables/user_secrets/constraints/user_secrets_pkey from pg

BEGIN;


ALTER TABLE "users_simple_secrets".user_secrets 
    DROP CONSTRAINT user_secrets_pkey;

COMMIT;  

