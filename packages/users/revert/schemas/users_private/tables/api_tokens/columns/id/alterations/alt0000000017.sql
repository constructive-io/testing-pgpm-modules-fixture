-- Revert: schemas/users_private/tables/api_tokens/columns/id/alterations/alt0000000017 from pg

BEGIN;


ALTER TABLE "users_private".api_tokens 
    ALTER COLUMN id DROP NOT NULL;


COMMIT;  

