-- Revert: schemas/users_public/tables/emails/indexes/emails_owner_id_idx from pg

BEGIN;


DROP INDEX "users_public".emails_owner_id_idx;

COMMIT;  

