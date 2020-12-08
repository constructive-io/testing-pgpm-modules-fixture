-- Revert: schemas/users_private/tables/api_tokens/columns/user_id/alterations/alt0000000019 from pg

BEGIN;


ALTER TABLE "users_private".api_tokens 
    ALTER COLUMN user_id DROP NOT NULL;


COMMIT;  

