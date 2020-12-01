-- Revert: schemas/meta_public/tables/apps/constraints/apps_site_id_key from pg

BEGIN;


ALTER TABLE "meta_public".apps 
    DROP CONSTRAINT apps_site_id_key;

COMMIT;  

