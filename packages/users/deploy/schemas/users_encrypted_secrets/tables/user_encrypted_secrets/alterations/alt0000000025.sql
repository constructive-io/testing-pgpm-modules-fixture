-- Deploy: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/alterations/alt0000000025 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table

BEGIN;

ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets
    DISABLE ROW LEVEL SECURITY;
COMMIT;
