-- Revert: schemas/rls_public/tables/emails/alterations/alt0000000024 from pg

BEGIN;


ALTER TABLE "rls_public".emails
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

