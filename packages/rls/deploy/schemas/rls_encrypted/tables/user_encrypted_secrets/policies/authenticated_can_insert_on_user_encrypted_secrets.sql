-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/policies/authenticated_can_insert_on_user_encrypted_secrets to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_insert_on_user_encrypted_secrets ON "rls_encrypted".user_encrypted_secrets FOR INSERT TO authenticated WITH CHECK ( owner_id = jwt_public.current_user_id() );
COMMIT;
