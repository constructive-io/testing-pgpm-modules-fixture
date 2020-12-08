-- Verify: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/policies/authenticated_can_delete_on_user_encrypted_secrets on pg

BEGIN;
SELECT verify_policy('authenticated_can_delete_on_user_encrypted_secrets', 'users_encrypted_secrets.user_encrypted_secrets');
COMMIT;  

