-- Deploy: schemas/users_public/tables/users/policies/authenticated_can_insert_on_users to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table
-- requires: schemas/users_public/tables/users/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_insert_on_users ON "users_public".users FOR INSERT TO authenticated WITH CHECK ( id = "users_public".get_current_user_id() );
COMMIT;
