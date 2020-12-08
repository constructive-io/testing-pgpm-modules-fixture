-- Revert: schemas/users_public/tables/emails/policies/authenticated_can_select_on_emails from pg

BEGIN;
DROP POLICY authenticated_can_select_on_emails ON "users_public".emails;
COMMIT;  

