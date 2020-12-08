-- Revert: schemas/users_public/tables/emails/columns/owner_id/column from pg

BEGIN;


ALTER TABLE "users_public".emails DROP COLUMN owner_id;
COMMIT;  

