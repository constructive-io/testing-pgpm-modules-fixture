-- Revert: schemas/users_private/tables/api_tokens/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "users_private".api_tokens FROM authenticated;
COMMIT;  

