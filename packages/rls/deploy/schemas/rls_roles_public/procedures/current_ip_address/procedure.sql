-- Deploy: schemas/rls_roles_public/procedures/current_ip_address/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_roles_public/schema

BEGIN;

CREATE FUNCTION "rls_roles_public".current_ip_address ()
  RETURNS inet
AS $$
DECLARE
  v_ip_addr inet;
BEGIN
  IF current_setting('jwt.claims.ip_address', TRUE)
    IS NOT NULL THEN
    BEGIN
      v_ip_addr = current_setting('jwt.claims.ip_address', TRUE)::inet;
    EXCEPTION
      WHEN OTHERS THEN
      RAISE NOTICE 'Invalid IP';
    RETURN NULL;
    END;
    RETURN v_ip_addr;
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql' STABLE;
GRANT EXECUTE ON FUNCTION "rls_roles_public".current_ip_address TO authenticated;
COMMIT;
