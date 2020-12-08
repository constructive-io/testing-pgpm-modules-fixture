-- Deploy: schemas/users_simple_secrets/tables/user_secrets/columns/owner_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_simple_secrets/schema
-- requires: schemas/users_simple_secrets/tables/user_secrets/table

BEGIN;

ALTER TABLE "users_simple_secrets".user_secrets ADD COLUMN owner_id uuid;
COMMIT;
