-- Revert: schemas/rls_public/tables/addresses/alterations/alt0000000069 from pg

BEGIN;
ALTER TABLE "rls_public".addresses DROP CONSTRAINT addresses_state_chk;
COMMIT;  

