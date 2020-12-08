-- Verify: schemas/users_private/tables/api_tokens/policies/authenticated_can_insert_on_api_tokens on pg

BEGIN;
SELECT verify_policy('authenticated_can_insert_on_api_tokens', 'users_private.api_tokens');
COMMIT;  

