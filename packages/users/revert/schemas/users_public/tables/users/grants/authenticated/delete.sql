-- Revert: schemas/users_public/tables/users/grants/authenticated/delete from pg

BEGIN;
REVOKE DELETE ON TABLE "users_public".users FROM authenticated;
COMMIT;  

