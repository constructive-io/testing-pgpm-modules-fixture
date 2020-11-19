-- Revert schemas/services_public/procedures/add_service from pg

BEGIN;

DROP FUNCTION services_public.add_service;

COMMIT;
