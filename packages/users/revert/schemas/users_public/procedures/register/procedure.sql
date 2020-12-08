-- Revert: schemas/users_public/procedures/register/procedure from pg

BEGIN;


DROP FUNCTION "users_public".register;

COMMIT;  

