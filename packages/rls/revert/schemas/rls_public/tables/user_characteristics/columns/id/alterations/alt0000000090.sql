-- Revert: schemas/rls_public/tables/user_characteristics/columns/id/alterations/alt0000000090 from pg

BEGIN;


ALTER TABLE "rls_public".user_characteristics 
    ALTER COLUMN id DROP NOT NULL;


COMMIT;  

