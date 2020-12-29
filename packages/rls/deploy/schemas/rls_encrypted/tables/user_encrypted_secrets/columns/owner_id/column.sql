-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/owner_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table

BEGIN;

ALTER TABLE "rls_encrypted".user_encrypted_secrets ADD COLUMN owner_id uuid;
COMMIT;
