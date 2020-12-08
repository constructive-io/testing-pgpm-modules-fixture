-- Revert: schemas/users_public/tables/emails/alterations/alt0000000035 from pg

BEGIN;


ALTER TABLE "users_public".emails
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

