-- Verify: schemas/users_private/tables/api_tokens/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('users_private.api_tokens', 'update', 'authenticated');
COMMIT;  

