-- Revert: schemas/users_public/tables/emails/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "users_public".emails FROM authenticated;
COMMIT;  

