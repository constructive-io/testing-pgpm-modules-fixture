-- Deploy schemas/meta_public/tables/permissions_module/table to pg

-- requires: schemas/meta_public/schema

BEGIN;

CREATE TABLE meta_public.permissions_module (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 ()
  -- fields
);

COMMENT ON TABLE meta_public.permissions_module IS 'A comment.';

COMMENT ON COLUMN meta_public.permissions_module.id IS 'The primary unique identifier for the permissions_module table.';

COMMIT;
