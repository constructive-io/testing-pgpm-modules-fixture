-- Deploy: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/columns/id/alterations/alt0000000027 to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/table
-- requires: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/columns/id/column

BEGIN;

ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets 
    ALTER COLUMN id SET DEFAULT "users_private".uuid_generate_v4();
COMMIT;
