-- Revert: schemas/meta_public/tables/apps/columns/site_id/column from pg

BEGIN;


ALTER TABLE "meta_public".apps DROP COLUMN site_id;
COMMIT;  

