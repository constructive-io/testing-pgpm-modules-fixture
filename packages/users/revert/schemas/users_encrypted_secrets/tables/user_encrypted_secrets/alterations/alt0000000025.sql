-- Revert: schemas/users_encrypted_secrets/tables/user_encrypted_secrets/alterations/alt0000000025 from pg

BEGIN;


ALTER TABLE "users_encrypted_secrets".user_encrypted_secrets
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

