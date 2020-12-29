-- Deploy: schemas/rls_public/tables/claimed_invites/policies/authenticated_can_select_on_claimed_invites to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema
-- requires: schemas/rls_public/tables/claimed_invites/table
-- requires: schemas/rls_public/tables/claimed_invites/policies/enable_row_level_security

BEGIN;
CREATE POLICY authenticated_can_select_on_claimed_invites ON "rls_public".claimed_invites FOR SELECT TO authenticated USING ( sender_id = jwt_public.current_user_id() OR receiver_id = jwt_public.current_user_id() );
COMMIT;
