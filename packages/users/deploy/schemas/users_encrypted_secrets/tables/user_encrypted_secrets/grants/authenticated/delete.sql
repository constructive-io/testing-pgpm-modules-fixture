-- Deploy: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/grants/authenticated/delete to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table

BEGIN;
GRANT DELETE ON TABLE "users_encrypted_secrets".user_encrypted_secrets TO authenticated;
COMMIT;
