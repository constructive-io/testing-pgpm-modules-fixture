-- Revert: schemas/meta_public/tables/apps/indexes/apps_site_id_idx from pg

BEGIN;


DROP INDEX "meta_public".apps_site_id_idx;

COMMIT;  

