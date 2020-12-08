-- Revert: schemas/users_public/tables/users/constraints/users_pkey from pg

BEGIN;


ALTER TABLE "users_public".users 
    DROP CONSTRAINT users_pkey;

COMMIT;  

