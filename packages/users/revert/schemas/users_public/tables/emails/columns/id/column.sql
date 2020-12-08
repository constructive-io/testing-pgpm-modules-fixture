-- Revert: schemas/users_public/tables/emails/columns/id/column from pg

BEGIN;


ALTER TABLE "users_public".emails DROP COLUMN id;
COMMIT;  

