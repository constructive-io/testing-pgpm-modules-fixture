-- Verify: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table on pg

BEGIN;
SELECT verify_table('users_encrypted_secrets.user_encrypted_secrets');
COMMIT;  

