-- Deploy: schemas/rls_public/alterations/alt0000000074 to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_public/schema

BEGIN;
COMMENT ON CONSTRAINT addresses_owner_id_fkey ON "rls_public".addresses IS E'@omit manyToMany';
COMMIT;
