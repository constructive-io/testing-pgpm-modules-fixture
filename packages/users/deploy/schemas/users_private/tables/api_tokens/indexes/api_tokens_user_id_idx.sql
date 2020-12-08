-- Deploy: schemas/users_private/tables/api_tokens/indexes/api_tokens_user_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table

BEGIN;

CREATE INDEX api_tokens_user_id_idx ON "users_private".api_tokens (user_id);
COMMIT;
