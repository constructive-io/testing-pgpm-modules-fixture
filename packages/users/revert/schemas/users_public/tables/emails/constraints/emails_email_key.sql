-- Revert: schemas/users_public/tables/emails/constraints/emails_email_key from pg

BEGIN;


ALTER TABLE "users_public".emails 
    DROP CONSTRAINT emails_email_key;

COMMIT;  

