-- Revert: schemas/users_private/procedures/seeded_uuid_related_trigger/procedure from pg

BEGIN;


DROP FUNCTION "users_private".seeded_uuid_related_trigger;
COMMIT;  

