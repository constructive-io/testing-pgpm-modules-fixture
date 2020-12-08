-- Verify: schemas/users_public/tables/users/grants/authenticated/insert on pg

BEGIN;
SELECT verify_table_grant('users_public.users', 'insert', 'authenticated');
COMMIT;  

