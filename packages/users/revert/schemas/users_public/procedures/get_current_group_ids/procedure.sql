-- Revert: schemas/users_public/procedures/get_current_group_ids/procedure from pg

BEGIN;


DROP FUNCTION "users_public".get_current_group_ids;

COMMIT;  

