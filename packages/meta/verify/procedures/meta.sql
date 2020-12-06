-- Verify procedures/meta  on pg

BEGIN;

SELECT verify_function ('public.meta');

ROLLBACK;
