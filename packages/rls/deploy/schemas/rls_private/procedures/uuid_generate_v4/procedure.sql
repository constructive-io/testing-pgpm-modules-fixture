-- Deploy: schemas/rls_private/procedures/uuid_generate_v4/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_private/schema

BEGIN;

CREATE FUNCTION "rls_private".uuid_generate_v4 ()
    RETURNS uuid
AS $$
    SELECT uuids.pseudo_order_seed_uuid('launchql');
$$
LANGUAGE sql;
GRANT EXECUTE ON FUNCTION "rls_private".uuid_generate_v4 TO public;
COMMIT;
