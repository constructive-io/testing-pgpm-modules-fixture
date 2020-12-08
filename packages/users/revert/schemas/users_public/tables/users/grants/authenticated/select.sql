-- Revert: schemas/users_public/tables/users/grants/authenticated/select from pg

BEGIN;
REVOKE SELECT ON TABLE "users_public".users FROM authenticated;
COMMIT;  

