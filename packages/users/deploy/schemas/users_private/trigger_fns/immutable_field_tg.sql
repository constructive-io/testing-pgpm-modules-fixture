-- Deploy: schemas/users_private/trigger_fns/immutable_field_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema

BEGIN;

CREATE FUNCTION "users_private".immutable_field_tg ()
RETURNS TRIGGER
AS $CODEZ$
BEGIN
  IF TG_NARGS > 0 THEN
    RAISE EXCEPTION 'IMMUTABLE_PROPERTY %', TG_ARGV[0];
  END IF;
  RAISE EXCEPTION 'IMMUTABLE_PROPERTY';
END;
$CODEZ$
LANGUAGE plpgsql VOLATILE;
COMMIT;
