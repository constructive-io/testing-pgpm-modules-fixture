-- Revert: schemas/users_private/tables/api_tokens/policies/enable_row_level_security from pg

BEGIN;


ALTER TABLE "users_private".api_tokens
    DISABLE ROW LEVEL SECURITY;

COMMIT;  

