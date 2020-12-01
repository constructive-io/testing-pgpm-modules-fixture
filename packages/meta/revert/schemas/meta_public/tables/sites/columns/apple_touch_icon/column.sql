-- Revert: schemas/meta_public/tables/sites/columns/apple_touch_icon/column from pg

BEGIN;


ALTER TABLE "meta_public".sites DROP COLUMN apple_touch_icon;
COMMIT;  

