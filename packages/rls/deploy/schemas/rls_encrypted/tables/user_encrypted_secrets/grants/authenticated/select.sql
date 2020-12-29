-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/grants/authenticated/select to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table

BEGIN;
GRANT SELECT ON TABLE "rls_encrypted".user_encrypted_secrets TO authenticated;
COMMIT;
