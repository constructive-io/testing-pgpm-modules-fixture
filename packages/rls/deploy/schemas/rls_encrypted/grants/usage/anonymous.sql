-- Deploy: schemas/rls_encrypted/grants/usage/anonymous to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema

BEGIN;

GRANT USAGE
ON SCHEMA "rls_encrypted"
TO anonymous;
COMMIT;
