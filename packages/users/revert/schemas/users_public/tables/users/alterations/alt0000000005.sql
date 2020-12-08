-- Revert: schemas/users_public/tables/users/alterations/alt0000000005 from pg

BEGIN;


ALTER TABLE "users_public".users
    ENABLE ROW LEVEL SECURITY;

COMMIT;  

