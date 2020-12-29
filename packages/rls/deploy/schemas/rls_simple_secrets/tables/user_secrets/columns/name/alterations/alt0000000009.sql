-- Deploy: schemas/rls_simple_secrets/tables/user_secrets/columns/name/alterations/alt0000000009 to pg
-- made with <3 @ launchql.com

-- requires: schemas/rls_simple_secrets/schema
-- requires: schemas/rls_simple_secrets/tables/user_secrets/table
-- requires: schemas/rls_simple_secrets/tables/user_secrets/columns/name/column

BEGIN;

ALTER TABLE "rls_simple_secrets".user_secrets 
    ALTER COLUMN name SET NOT NULL;
COMMIT;
