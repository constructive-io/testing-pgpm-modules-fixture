-- Revert: schemas/users_public/tables/emails/columns/is_verified/column from pg

BEGIN;


ALTER TABLE "users_public".emails DROP COLUMN is_verified;
COMMIT;  

