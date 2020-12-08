-- Revert: schemas/users_public/tables/users/policies/authenticated_can_insert_on_users from pg

BEGIN;
DROP POLICY authenticated_can_insert_on_users ON "users_public".users;
COMMIT;  

