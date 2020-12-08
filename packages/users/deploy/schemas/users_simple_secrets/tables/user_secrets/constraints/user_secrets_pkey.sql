-- Deploy: schemas/users_simple_secrets/tables/user_secrets/constraints/user_secrets_pkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_simple_secrets/schema
-- requires: schemas/users_simple_secrets/tables/user_secrets/table

BEGIN;

ALTER TABLE "users_simple_secrets".user_secrets
    ADD CONSTRAINT user_secrets_pkey PRIMARY KEY (id);
COMMIT;
