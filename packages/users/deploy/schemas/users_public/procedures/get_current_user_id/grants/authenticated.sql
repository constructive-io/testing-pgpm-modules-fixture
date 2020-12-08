-- Deploy: schemas/users_public/procedures/get_current_user_id/grants/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/procedures/get_current_user_id/procedure

BEGIN;

GRANT EXECUTE ON FUNCTION
    "users_public".get_current_user_id
TO authenticated;
COMMIT;
