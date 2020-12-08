-- Revert: schemas/users_private/trigger_fns/tg_peoplestamps from pg

BEGIN;


DROP FUNCTION "users_private".tg_peoplestamps();
COMMIT;  

