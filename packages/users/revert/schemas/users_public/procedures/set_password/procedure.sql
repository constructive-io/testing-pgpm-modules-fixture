-- Revert: schemas/users_public/procedures/set_password/procedure from pg

BEGIN;


DROP FUNCTION "users_public".set_password;
COMMIT;  

