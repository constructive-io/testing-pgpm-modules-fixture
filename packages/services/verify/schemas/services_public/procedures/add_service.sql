-- Verify schemas/services_public/procedures/add_service  on pg

BEGIN;

SELECT verify_function ('services_public.add_service');

ROLLBACK;
