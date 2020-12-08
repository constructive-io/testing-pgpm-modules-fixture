-- Deploy: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/triggers/user_encrypted_secrets_insert_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/users_encrypted_secrets/trigger_fns/user_encrypted_secrets_hash

BEGIN;

CREATE TRIGGER user_encrypted_secrets_insert_tg BEFORE
INSERT
    ON "users_encrypted_secrets".user_encrypted_secrets FOR EACH ROW
EXECUTE PROCEDURE "users_encrypted_secrets".user_encrypted_secrets_hash ();
COMMIT;
