-- Revert: schemas/rls_public/tables/addresses/columns/id/alterations/alt0000000063 from pg

BEGIN;


ALTER TABLE "rls_public".addresses 
    ALTER COLUMN id DROP NOT NULL;


COMMIT;  

