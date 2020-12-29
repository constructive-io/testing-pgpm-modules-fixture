-- Deploy: schemas/rls_encrypted/tables/user_encrypted_secrets/constraints/user_encrypted_secrets_owner_id_name_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_encrypted/tables/user_encrypted_secrets/table

BEGIN;

ALTER TABLE "rls_encrypted".user_encrypted_secrets
    ADD CONSTRAINT user_encrypted_secrets_owner_id_name_key UNIQUE (owner_id,name);
COMMIT;
