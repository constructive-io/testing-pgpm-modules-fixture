-- Deploy schemas/jwt_public/procedures/current_group_ids to pg
-- Retrieves the current user's group IDs from JWT claims

-- requires: schemas/jwt_public/schema

BEGIN;

-- Returns an array of group UUIDs the current user belongs to
-- Useful for group-based access control and permissions
-- Returns empty array if the claim is not set or invalid
CREATE FUNCTION jwt_public.current_group_ids()
  RETURNS uuid[]
AS $$
DECLARE
  v_identifier_ids uuid[];
BEGIN
  IF current_setting('jwt.claims.group_ids', TRUE)
    IS NOT NULL THEN
    BEGIN
      v_identifier_ids = current_setting('jwt.claims.group_ids', TRUE)::uuid[];
    EXCEPTION
      WHEN OTHERS THEN
      RAISE NOTICE 'Invalid UUID value';
    RETURN ARRAY[]::uuid[];
    END;
    RETURN v_identifier_ids;
  ELSE
    RETURN ARRAY[]::uuid[];
  END IF;
END;
$$
LANGUAGE 'plpgsql' STABLE;

COMMIT;
