-- Revert: schemas/users_public/tables/users/grants/authenticated/update from pg

BEGIN;
REVOKE UPDATE ON TABLE "users_public".users FROM authenticated;
COMMIT;  

