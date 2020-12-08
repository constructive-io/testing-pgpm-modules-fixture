-- Revert: schemas/users_public/procedures/reset_password/procedure from pg

BEGIN;


DROP FUNCTION "users_public".reset_password;

COMMIT;  

