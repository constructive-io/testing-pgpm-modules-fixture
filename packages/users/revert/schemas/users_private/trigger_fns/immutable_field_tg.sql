-- Revert: schemas/users_private/trigger_fns/immutable_field_tg from pg

BEGIN;


DROP FUNCTION "users_private".immutable_field_tg;
COMMIT;  

