-- Deploy: schemas/rls_roles_public/procedures/register/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_encrypted/schema
-- requires: schemas/rls_roles_public/schema
-- requires: schemas/rls_public/tables/users/table
-- requires: schemas/rls_public/tables/emails/table
-- requires: schemas/rls_roles_private/tables/api_tokens/table

BEGIN;

CREATE FUNCTION "rls_roles_public".register (
  email text,
  password text,
  remember_me boolean DEFAULT FALSE
)
  RETURNS "rls_roles_private".api_tokens
  AS $$
DECLARE
  v_user "rls_public".users;
  v_email "rls_public".emails;
  v_token "rls_roles_private".api_tokens;
BEGIN
  IF (password IS NULL) THEN 
    RAISE EXCEPTION 'PASSWORD_LEN';
  END IF;
  password = trim(password);
  IF (character_length(password) <= 7 OR character_length(password) >= 64) THEN 
    RAISE EXCEPTION 'PASSWORD_LEN';
  END IF;
  SELECT * FROM "rls_public".emails t
    WHERE trim(register.email)::email = t.email
  INTO v_email;
  IF (NOT FOUND) THEN
    INSERT INTO "rls_public".users
      DEFAULT VALUES
    RETURNING
      * INTO v_user;
    INSERT INTO "rls_public".emails (owner_id, email)
      VALUES (v_user.id, trim(register.email))
    RETURNING
      * INTO v_email;
    IF (remember_me IS TRUE) THEN 
      INSERT INTO "rls_roles_private".api_tokens (
        user_id,
        access_token_expires_at
      )
      VALUES (
        v_user.id,
        ( NOW() + '1 year'::interval )
      )
      RETURNING
        * INTO v_token;
    ELSE 
      INSERT INTO "rls_roles_private".api_tokens (
        user_id
      )
      VALUES (
        v_user.id
      )
      RETURNING
        * INTO v_token;
    END IF;
    PERFORM "rls_encrypted".set
      (v_user.id, 'password_hash', trim(password), 'crypt');
    RETURN v_token;
  END IF;
  RAISE EXCEPTION 'ACCOUNT_EXISTS';
END;
$$
LANGUAGE plpgsql
VOLATILE
SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION "rls_roles_public".register TO anonymous;
COMMIT;
