-- Revert: schemas/rls_public/tables/invites/columns/invite_count/alterations/alt0000000043 from pg

BEGIN;


ALTER TABLE "rls_public".invites 
    ALTER COLUMN invite_count DROP DEFAULT;

COMMIT;  

