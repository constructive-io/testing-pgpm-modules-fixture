-- Revert: schemas/users_public/tables/emails/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "users_public".emails FROM authenticated;
COMMIT;  

