-- Deploy: schemas/users_simple_secrets/tables/user_secrets/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_simple_secrets/schema
-- requires: schemas/users_simple_secrets/tables/user_secrets/table

BEGIN;
GRANT SELECT ON TABLE "users_simple_secrets".user_secrets TO authenticated;
COMMIT;
