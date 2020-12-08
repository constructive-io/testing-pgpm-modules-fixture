-- Revert: schemas/users_public/tables/emails/columns/owner_id/alterations/alt0000000038 from pg

BEGIN;


ALTER TABLE "users_public".emails 
    ALTER COLUMN owner_id DROP NOT NULL;


COMMIT;  

