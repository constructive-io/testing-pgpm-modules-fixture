-- Revert: schemas/users_public/procedures/send_verification_email/procedure from pg

BEGIN;


DROP FUNCTION "users_public".send_verification_email;
COMMIT;  

