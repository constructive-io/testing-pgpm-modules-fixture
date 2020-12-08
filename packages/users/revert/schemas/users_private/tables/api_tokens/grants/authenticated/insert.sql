-- Revert: schemas/users_private/tables/api_tokens/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "users_private".api_tokens FROM authenticated;
COMMIT;  

