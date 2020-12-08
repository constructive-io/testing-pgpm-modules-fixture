-- Deploy: schemas/users_public/tables/emails/triggers/emails_insert_job_tg to pg
-- made with <3 @ launchql.com

-- requires: schemas/users_public/schema

BEGIN;

CREATE TRIGGER emails_insert_job_tg AFTER
INSERT
    ON "users_public".emails FOR EACH ROW
EXECUTE PROCEDURE app_jobs.tg_add_job_with_row ('new-user-email');
COMMIT;
