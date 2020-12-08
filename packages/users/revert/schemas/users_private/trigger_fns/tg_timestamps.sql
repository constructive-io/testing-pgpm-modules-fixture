-- Revert: schemas/users_private/trigger_fns/tg_timestamps from pg

BEGIN;


DROP FUNCTION "users_private".tg_timestamps();
COMMIT;  

