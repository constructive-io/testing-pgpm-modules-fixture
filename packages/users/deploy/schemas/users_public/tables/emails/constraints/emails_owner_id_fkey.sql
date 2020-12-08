-- Deploy: schemas/users_public/tables/emails/constraints/emails_owner_id_fkey to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema
-- requires: schemas/users_public/tables/users/table
-- requires: schemas/users_public/tables/emails/table
-- requires: schemas/users_public/tables/users/columns/id/column
-- requires: schemas/users_public/tables/emails/columns/owner_id/column

BEGIN;

ALTER TABLE "users_public".emails 
    ADD CONSTRAINT emails_owner_id_fkey 
    FOREIGN KEY (owner_id)
    REFERENCES "users_public".users (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
COMMIT;
