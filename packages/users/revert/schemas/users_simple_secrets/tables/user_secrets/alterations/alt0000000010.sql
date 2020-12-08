-- Revert: schemas/users_simple_secrets/tables/user_secrets/alterations/alt0000000010 from pg

BEGIN;


ALTER TABLE "users_simple_secrets".user_secrets
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

