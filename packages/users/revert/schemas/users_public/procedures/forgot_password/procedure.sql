-- Revert: schemas/users_public/procedures/forgot_password/procedure from pg

BEGIN;


DROP FUNCTION "users_public".forgot_password;
COMMIT;  

