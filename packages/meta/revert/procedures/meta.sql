-- Revert procedures/meta from pg

BEGIN;

DROP FUNCTION public.meta;

COMMIT;
