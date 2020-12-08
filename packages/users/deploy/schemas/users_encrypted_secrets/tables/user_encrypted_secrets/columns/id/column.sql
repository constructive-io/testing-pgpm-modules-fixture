-- Deploy: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/columns/id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table

BEGIN;

ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets ADD COLUMN id uuid;
COMMIT;
