-- Revert: schemas/rls_encrypted/tables/user_encrypted_secrets/policies/authenticated_can_delete_on_user_encrypted_secrets from pg

BEGIN;
DROP POLICY authenticated_can_delete_on_user_encrypted_secrets ON "rls_encrypted".user_encrypted_secrets;
COMMIT;  

