-- Deploy: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/policies/authenticated_can_select_on_user_encrypted_secrets to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_user_encrypted_secrets ON "users_encrypted_secrets".user_encrypted_secrets FOR SELECT TO authenticated USING ( owner_id = "users_public".get_current_user_id() );
COMMIT;
