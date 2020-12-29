-- Revert: schemas/rls_public/tables/user_connections/alterations/alt0000000103 from pg

BEGIN;


ALTER TABLE "rls_public".user_connections
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

