-- Revert: schemas/users_simple_secrets/tables/user_secrets/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "users_simple_secrets".user_secrets FROM authenticated;
COMMIT;  

