-- Deploy: schemas/users_public/procedures/get_current_user/grants/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/procedures/get_current_user/procedure

BEGIN;

GRANT EXECUTE ON FUNCTION
    "users_public".get_current_user
TO authenticated;
COMMIT;
