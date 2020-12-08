-- Deploy: schemas/users_public/grants/usage/authenticated to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema

BEGIN;

GRANT USAGE
ON SCHEMA "users_public"
TO authenticated;
COMMIT;
