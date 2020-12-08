-- Verify: schemas/users_public/tables/users/table on pg

BEGIN;
SELECT verify_table('users_public.users');
COMMIT;  

