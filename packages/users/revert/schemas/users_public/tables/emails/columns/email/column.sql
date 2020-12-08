-- Revert: schemas/users_public/tables/emails/columns/email/column from pg

BEGIN;


ALTER TABLE "users_public".emails DROP COLUMN email;
COMMIT;  

