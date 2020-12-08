-- Verify: schemas/users_public/tables/emails/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('users_public.emails', 'update', 'authenticated');
COMMIT;  

