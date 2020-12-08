-- Verify: schemas/users_public/tables/emails/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('users_public.emails', 'delete', 'authenticated');
COMMIT;  

