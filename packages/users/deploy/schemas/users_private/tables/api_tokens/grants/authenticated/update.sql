-- Deploy: schemas/users_private/tables/api_tokens/grants/authenticated/update to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table

BEGIN;
GRANT UPDATE ON TABLE "users_private".api_tokens TO authenticated;
COMMIT;
