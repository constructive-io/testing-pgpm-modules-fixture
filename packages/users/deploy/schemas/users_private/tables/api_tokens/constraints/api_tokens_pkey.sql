-- Deploy: schemas/users_private/tables/api_tokens/constraints/api_tokens_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_private/schema
-- requires: schemas/users_private/tables/api_tokens/table

BEGIN;

ALTER TABLE "users_private".api_tokens
    ADD CONSTRAINT api_tokens_pkey PRIMARY KEY (id);
COMMIT;
