-- Revert: schemas/users_public/tables/emails/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "users_public".emails FROM authenticated;
COMMIT;  

