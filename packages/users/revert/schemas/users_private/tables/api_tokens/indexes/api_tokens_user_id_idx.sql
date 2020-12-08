-- Revert: schemas/users_private/tables/api_tokens/indexes/api_tokens_user_id_idx from pg

BEGIN;


DROP INDEX "users_private".api_tokens_user_id_idx;

COMMIT;  

