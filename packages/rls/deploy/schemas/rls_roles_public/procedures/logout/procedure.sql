-- Deploy: schemas/rls_roles_public/procedures/logout/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_roles_public/schema
-- requires: schemas/rls_roles_private/tables/api_tokens/table

BEGIN;

CREATE FUNCTION "rls_roles_public".logout (
  token text
)
  RETURNS void
  AS $$
BEGIN
  IF (token IS NOT NULL) THEN 
      DELETE FROM "rls_roles_private".api_tokens t
    WHERE t.access_token = logout.token;
  END IF;
END;
$$
LANGUAGE plpgsql
VOLATILE
SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION "rls_roles_public".logout TO authenticated;
COMMIT;
