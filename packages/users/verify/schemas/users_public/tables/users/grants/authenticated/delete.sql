-- Verify: schemas/users_public/tables/users/grants/authenticated/delete on pg

BEGIN;
SELECT verify_table_grant('users_public.users', 'delete', 'authenticated');
COMMIT;  

