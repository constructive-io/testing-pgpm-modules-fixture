-- Revert: schemas/users_private/tables/api_tokens/policies/authenticated_can_select_on_api_tokens from pg

BEGIN;
DROP POLICY authenticated_can_select_on_api_tokens ON "users_private".api_tokens;
COMMIT;  

