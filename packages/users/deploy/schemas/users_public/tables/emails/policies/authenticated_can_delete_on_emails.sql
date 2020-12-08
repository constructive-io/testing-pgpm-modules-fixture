-- Deploy: schemas/users_public/tables/emails/policies/authenticated_can_delete_on_emails to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_public/tables/emails/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_delete_on_emails ON "users_public".emails FOR DELETE TO authenticated USING ( owner_id = "users_public".get_current_user_id() );
COMMIT;
