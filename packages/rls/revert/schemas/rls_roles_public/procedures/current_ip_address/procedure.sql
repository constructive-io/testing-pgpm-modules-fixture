-- Revert: schemas/rls_roles_public/procedures/current_ip_address/procedure from pg

BEGIN;


DROP FUNCTION "rls_roles_public".current_ip_address;

COMMIT;  

