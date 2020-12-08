-- Verify: schemas/users_simple_secrets/tables/user_secrets/table on pg

BEGIN;
SELECT verify_table('users_simple_secrets.user_secrets');
COMMIT;  

