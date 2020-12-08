-- Revert: schemas/users_private/procedures/uuid_generate_v4/procedure from pg

BEGIN;


DROP FUNCTION "users_private".uuid_generate_v4;
COMMIT;  

