-- Revert: schemas/users_private/procedures/uuid_generate_seeded_uuid/procedure from pg

BEGIN;


DROP FUNCTION "users_private".uuid_generate_seeded_uuid;
COMMIT;  

