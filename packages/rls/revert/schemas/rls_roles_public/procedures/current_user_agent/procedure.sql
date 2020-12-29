-- Revert: schemas/rls_roles_public/procedures/current_user_agent/procedure from pg

BEGIN;


DROP FUNCTION "rls_roles_public".current_user_agent;

COMMIT;  

