-- Revert: schemas/users_private/procedures/authenticate/procedure from pg

BEGIN;


DROP FUNCTION "users_private".authenticate;
COMMIT;  

