-- Revert: schemas/rls_public/tables/invites/columns/expires_at/alterations/alt0000000046 from pg

BEGIN;


ALTER TABLE "rls_public".invites 
    ALTER COLUMN expires_at DROP NOT NULL;


COMMIT;  

