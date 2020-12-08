-- Deploy: schemas/users_public/procedures/get_current_user/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table

BEGIN;

CREATE FUNCTION "users_public".get_current_user()
    RETURNS "users_public".users
AS $$
DECLARE
  v_user "users_public".users;
BEGIN
  IF "users_public".get_current_user_id() IS NOT NULL THEN
     SELECT * FROM "users_public".users WHERE id = "users_public".get_current_user_id() INTO v_user;
     RETURN v_user;
  ELSE
     RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql' STABLE;
COMMIT;
