-- Verify: schemas/users_private/tables/api_tokens/table on pg

BEGIN;
SELECT verify_table('users_private.api_tokens');
COMMIT;  

