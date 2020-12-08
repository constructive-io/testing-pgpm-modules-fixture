-- Deploy: schemas/users_private/tables/api_tokens/policies/authenticated_can_select_on_api_tokens to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table
-- requires: schemas/users_private/tables/api_tokens/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_api_tokens ON "users_private".api_tokens FOR SELECT TO authenticated USING ( user_id = "users_public".get_current_user_id() );
COMMIT;
