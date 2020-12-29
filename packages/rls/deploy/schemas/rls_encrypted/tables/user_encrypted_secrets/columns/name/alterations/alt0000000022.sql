-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/name/alterations/alt0000000022 to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/columns/name/column

BEGIN;

ALTER TABLE "rls_encrypted".user_encrypted_secrets 
    ALTER COLUMN name SET NOT NULL;
COMMIT;
