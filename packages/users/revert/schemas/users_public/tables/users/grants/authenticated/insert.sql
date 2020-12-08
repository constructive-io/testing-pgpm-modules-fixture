-- Revert: schemas/users_public/tables/users/grants/authenticated/insert from pg

BEGIN;
REVOKE INSERT ON TABLE "users_public".users FROM authenticated;
COMMIT;  

