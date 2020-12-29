-- Deploy: schemas/rls_roles_public/procedures/current_user_agent/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_roles_public/schema

BEGIN;

CREATE FUNCTION "rls_roles_public".current_user_agent ()
  RETURNS text
AS $$
DECLARE
  v_uagent text;
BEGIN
  IF current_setting('jwt.claims.user_agent', TRUE)
    IS NOT NULL THEN
    BEGIN
      v_uagent = current_setting('jwt.claims.user_agent', TRUE);
    EXCEPTION
      WHEN OTHERS THEN
      RAISE NOTICE 'Invalid UserAgent';
    RETURN NULL;
    END;
    RETURN v_uagent;
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql' STABLE;
GRANT EXECUTE ON FUNCTION "rls_roles_public".current_user_agent TO authenticated;
COMMIT;
