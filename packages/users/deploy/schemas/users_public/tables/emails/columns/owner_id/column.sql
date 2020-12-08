-- Deploy: schemas/users_public/tables/emails/columns/owner_id/column to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/emails/table

BEGIN;

ALTER TABLE "users_public".emails ADD COLUMN owner_id uuid;
COMMIT;
