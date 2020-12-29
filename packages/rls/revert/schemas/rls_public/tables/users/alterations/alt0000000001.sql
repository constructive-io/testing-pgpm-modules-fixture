-- Revert: schemas/rls_public/tables/users/alterations/alt0000000001 from pg

BEGIN;


ALTER TABLE "rls_public".users
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

