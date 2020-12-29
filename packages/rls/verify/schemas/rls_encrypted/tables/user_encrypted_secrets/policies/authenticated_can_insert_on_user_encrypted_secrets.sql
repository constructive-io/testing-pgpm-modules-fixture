-- Verify: schemas/rls_encrypted/tables/user_encrypted_secrets/policies/authenticated_can_insert_on_user_encrypted_secrets on pg

BEGIN;
SELECT verify_policy('authenticated_can_insert_on_user_encrypted_secrets', 'rls_encrypted.user_encrypted_secrets');
COMMIT;  

