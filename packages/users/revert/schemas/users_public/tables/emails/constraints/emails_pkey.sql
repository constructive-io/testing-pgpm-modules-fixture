-- Revert: schemas/users_public/tables/emails/constraints/emails_pkey from pg

BEGIN;


ALTER TABLE "users_public".emails 
    DROP CONSTRAINT emails_pkey;

COMMIT;  

