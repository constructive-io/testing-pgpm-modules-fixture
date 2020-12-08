-- Deploy: schemas/users_public/procedures/register/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_public/tables/users/table
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_private/tables/api_tokens/table

BEGIN;

CREATE FUNCTION "users_public".register (
  email text,
  password text
)
  RETURNS "users_private".api_tokens
  AS $$
DECLARE
  v_user "users_public".users;
  v_email "users_public".emails;
  v_token "users_private".api_tokens;
BEGIN
  IF (password IS NULL) THEN 
    RAISE EXCEPTION 'PASSWORD_LEN';
  END IF;
  password = trim(password);
  IF (character_length(password) <= 7 OR character_length(password) >= 64) THEN 
    RAISE EXCEPTION 'PASSWORD_LEN';
  END IF;
  SELECT * FROM "users_public".emails t
    WHERE trim(register.email)::email = t.email
  INTO v_email;
  IF (NOT FOUND) THEN
    INSERT INTO "users_public".users
      DEFAULT VALUES
    RETURNING
      * INTO v_user;
    INSERT INTO "users_public".emails (owner_id, email)
      VALUES (v_user.id, trim(register.email))
    RETURNING
      * INTO v_email;
    INSERT INTO "users_private".api_tokens (user_id)
      VALUES (v_user.id)
    RETURNING
      * INTO v_token;
    PERFORM "users_encrypted_secrets".set
      (v_user.id, 'password_hash', trim(password), 'crypt');
    RETURN v_token;
  END IF;
  RAISE EXCEPTION 'ACCOUNT_EXISTS';
END;
$$
LANGUAGE plpgsql
VOLATILE
SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION "users_public".register TO anonymous;
COMMIT;
