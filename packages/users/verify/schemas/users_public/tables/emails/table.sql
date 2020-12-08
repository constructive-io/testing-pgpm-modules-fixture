-- Verify: schemas/users_public/tables/emails/table on pg

BEGIN;
SELECT verify_table('users_public.emails');
COMMIT;  

