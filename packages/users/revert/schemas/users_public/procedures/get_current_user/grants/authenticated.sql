-- Revert: schemas/users_public/procedures/get_current_user/grants/authenticated from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "users_public".get_current_user
FROM authenticated;
COMMIT;  

