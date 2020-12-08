-- Revert: schemas/users_public/procedures/get_current_user/procedure from pg

BEGIN;


DROP FUNCTION "users_public".get_current_user;
COMMIT;  

