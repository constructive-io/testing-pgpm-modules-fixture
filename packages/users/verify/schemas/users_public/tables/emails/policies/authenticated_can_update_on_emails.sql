-- Verify: schemas/users_public/tables/emails/policies/authenticated_can_update_on_emails on pg

BEGIN;
SELECT verify_policy('authenticated_can_update_on_emails', 'users_public.emails');
COMMIT;  

