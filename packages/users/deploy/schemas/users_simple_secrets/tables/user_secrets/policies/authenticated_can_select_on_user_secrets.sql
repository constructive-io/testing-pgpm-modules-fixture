-- Deploy: schemas/users_simple_secrets/tables/user_secrets/policies/authenticated_can_select_on_user_secrets to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_simple_secrets/schema
-- requires: schemas/users_simple_secrets/tables/user_secrets/table
-- requires: schemas/users_simple_secrets/tables/user_secrets/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_user_secrets ON "users_simple_secrets".user_secrets FOR SELECT TO authenticated USING ( owner_id = "users_public".get_current_user_id() );
COMMIT;
