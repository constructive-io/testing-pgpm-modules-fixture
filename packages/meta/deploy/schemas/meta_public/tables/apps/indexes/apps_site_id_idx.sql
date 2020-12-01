-- Deploy: schemas/meta_public/tables/apps/indexes/apps_site_id_idx to pg
-- made with <3 @ launchql.com

-- requires: schemas/meta_public/schema
-- requires: schemas/meta_public/tables/apps/table

BEGIN;

CREATE INDEX apps_site_id_idx ON "meta_public".apps (site_id);
COMMIT;
