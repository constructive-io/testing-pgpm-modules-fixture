-- Revert: schemas/users_public/tables/emails/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "users_public".emails FROM authenticated;
COMMIT;  

