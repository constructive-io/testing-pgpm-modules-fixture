-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/owner_id/alterations/alt0000000021 to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/owner_id/column

BEGIN;

ALTER TABLE "rls_encrypted".user_encrypted_secrets 
    ALTER COLUMN owner_id SET NOT NULL;
COMMIT;
