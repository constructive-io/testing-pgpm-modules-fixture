-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/alterations/alt0000000018 to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table

BEGIN;

ALTER TABLE "rls_encrypted".user_encrypted_secrets
    DISABLE ROW LEVEL SECURITY;
COMMIT;
