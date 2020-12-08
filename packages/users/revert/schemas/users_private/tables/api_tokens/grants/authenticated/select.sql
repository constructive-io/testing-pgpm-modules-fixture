-- Revert: schemas/users_private/tables/api_tokens/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "users_private".api_tokens FROM authenticated;
COMMIT;  

