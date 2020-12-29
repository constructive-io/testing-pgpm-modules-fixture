-- Verify: schemas/rls_encrypted/tables/user_encrypted_secrets/table on pg

BEGIN;
SELECT verify_table('rls_encrypted.user_encrypted_secrets');
COMMIT;  

