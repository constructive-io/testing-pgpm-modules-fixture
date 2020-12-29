-- Revert: schemas/rls_roles_public/procedures/logout/procedure from pg

BEGIN;


DROP FUNCTION "rls_roles_public".logout;

COMMIT;  

