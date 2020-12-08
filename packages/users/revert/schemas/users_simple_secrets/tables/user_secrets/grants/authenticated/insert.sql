-- Revert: schemas/users_simple_secrets/tables/user_secrets/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "users_simple_secrets".user_secrets FROM authenticated;
COMMIT;  

