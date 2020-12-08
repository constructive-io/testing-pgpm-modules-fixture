-- Revert: schemas/users_simple_secrets/tables/user_secrets/columns/owner_id/alterations/alt0000000013 from pg

BEGIN;


ALTER TABLE "users_simple_secrets".user_secrets 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

