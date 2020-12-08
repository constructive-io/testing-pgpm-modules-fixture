-- Revert: schemas/users_public/procedures/get_current_group_ids/grants/authenticated from pg

BEGIN;


REVOKE EXECUTE ON FUNCTION
    "users_public".get_current_group_ids
FROM authenticated;
COMMIT;  

