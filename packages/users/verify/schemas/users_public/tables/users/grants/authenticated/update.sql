-- Verify: schemas/users_public/tables/users/grants/authenticated/update on pg

BEGIN;
SELECT verify_table_grant('users_public.users', 'update', 'authenticated');
COMMIT;  

