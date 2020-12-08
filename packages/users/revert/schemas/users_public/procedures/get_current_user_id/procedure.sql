-- Revert: schemas/users_public/procedures/get_current_user_id/procedure from pg

BEGIN;


DROP FUNCTION "users_public".get_current_user_id;

COMMIT;  

