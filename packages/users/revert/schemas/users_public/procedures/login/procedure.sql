-- Revert: schemas/users_public/procedures/login/procedure from pg

BEGIN;


DROP FUNCTION "users_public".login;
COMMIT;  

