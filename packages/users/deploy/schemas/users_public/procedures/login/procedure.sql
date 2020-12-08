-- Deploy: schemas/users_public/procedures/login/procedure to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_encrypted_secrets/schema
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_private/tables/api_tokens/table
-- requires: schemas/users_simple_secrets/tables/user_secrets/table

BEGIN;

CREATE FUNCTION "users_public".login (
  email text,
  PASSWORD text
)
  RETURNS "users_private".api_tokens
  AS $$
DECLARE
  v_token "users_private".api_tokens;
  v_email "users_public".emails;
  v_sign_in_attempt_window_duration interval = interval '6 hours';
  v_sign_in_max_attempts int = 10;
  first_failed_password_attempt timestamptz;
  password_attempts int;
BEGIN
  SELECT
    user_emails_alias.*
  FROM
    "users_public".emails AS user_emails_alias
  WHERE
    user_emails_alias.email = login.email::email INTO v_email;
  
  IF (NOT FOUND) THEN
    RETURN NULL;
  END IF;
  first_failed_password_attempt = "users_simple_secrets".get(v_email.owner_id, 'first_failed_password_attempt');
  password_attempts = "users_simple_secrets".get(v_email.owner_id, 'password_attempts');
  IF (
    first_failed_password_attempt IS NOT NULL
      AND
    first_failed_password_attempt > NOW() - v_sign_in_attempt_window_duration
      AND
    password_attempts >= v_sign_in_max_attempts
  ) THEN
    RAISE EXCEPTION 'ACCOUNT_LOCKED_EXCEED_ATTEMPTS';
  END IF;
  IF ("users_encrypted_secrets".verify(v_email.owner_id, 'password_hash', PASSWORD)) THEN
    PERFORM "users_simple_secrets".del(v_email.owner_id,
    ARRAY[
      'password_attempts', 'first_failed_password_attempt'
    ]);
    INSERT INTO "users_private".api_tokens (user_id)
      VALUES (v_email.owner_id)
    RETURNING
      * INTO v_token;
    RETURN v_token;
  ELSE
    IF (password_attempts IS NULL) THEN
      password_attempts = 0;
    END IF;
    IF (
      first_failed_password_attempt IS NULL
        OR
      first_failed_password_attempt < NOW() - v_sign_in_attempt_window_duration
    ) THEN
      password_attempts = 1;
      first_failed_password_attempt = NOW();
    ELSE 
      password_attempts = password_attempts + 1;
    END IF;
    PERFORM "users_simple_secrets".set(v_email.owner_id, 'password_attempts', password_attempts);
    PERFORM "users_simple_secrets".set(v_email.owner_id, 'first_failed_password_attempt', first_failed_password_attempt);
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE 'plpgsql'
STRICT
SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION "users_public".login TO anonymous;
COMMIT;
