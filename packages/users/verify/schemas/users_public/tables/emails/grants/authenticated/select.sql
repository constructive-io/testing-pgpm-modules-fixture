-- Verify: schemas/users_public/tables/emails/grants/authenticated/select on pg

BEGIN;
SELECT verify_table_grant('users_public.emails', 'select', 'authenticated');
COMMIT;  

