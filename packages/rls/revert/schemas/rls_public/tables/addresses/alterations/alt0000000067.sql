-- Revert: schemas/rls_public/tables/addresses/alterations/alt0000000067 from pg

BEGIN;
ALTER TABLE "rls_public".addresses DROP CONSTRAINT addresses_address_line_3_chk;
COMMIT;  

