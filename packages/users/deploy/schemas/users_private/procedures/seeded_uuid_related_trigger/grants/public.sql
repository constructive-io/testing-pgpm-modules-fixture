-- Deploy: schemas/users_private/procedures/seeded_uuid_related_trigger/grants/public to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/procedures/seeded_uuid_related_trigger/procedure

BEGIN;

GRANT EXECUTE ON FUNCTION
    "users_private".seeded_uuid_related_trigger
TO public;
COMMIT;
