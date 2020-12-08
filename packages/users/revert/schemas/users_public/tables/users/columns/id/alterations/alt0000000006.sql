-- Revert: schemas/users_public/tables/users/columns/id/alterations/alt0000000006 from pg

BEGIN;


ALTER TABLE "users_public".users 
    ALTER COLUMN id DROP NOT NULL;


COMMIT;  

