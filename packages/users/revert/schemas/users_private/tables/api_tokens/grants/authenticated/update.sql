-- Revert: schemas/users_private/tables/api_tokens/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "users_private".api_tokens FROM authenticated;
COMMIT;  

