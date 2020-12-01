-- Deploy: schemas/meta_public/tables/apps/constraints/apps_site_id_key to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

ALTER TABLE "meta_public".apps
    ADD CONSTRAINT apps_site_id_key UNIQUE (site_id);
COMMIT;
