-- Verify: schemas/users_public/tables/emails/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('users_public.emails', 'insert', 'authenticated');
COMMIT;  

