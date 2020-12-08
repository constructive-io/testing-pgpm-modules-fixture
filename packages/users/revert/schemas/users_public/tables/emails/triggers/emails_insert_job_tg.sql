-- Revert: schemas/users_public/tables/emails/triggers/emails_insert_job_tg from pg

BEGIN;


DROP TRIGGER emails_insert_job_tg
    ON "users_public".emails;
COMMIT;  

