-- Verify: schemas/rls_encrypted/tables/user_encrypted_secrets/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('rls_encrypted.user_encrypted_secrets', 'insert', 'authenticated');
COMMIT;  

