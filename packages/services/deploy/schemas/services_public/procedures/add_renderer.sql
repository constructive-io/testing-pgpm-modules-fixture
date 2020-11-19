-- Deploy schemas/services_public/procedures/add_renderer to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table
-- requires: schemas/services_public/procedures/add_service 

BEGIN;

CREATE FUNCTION services_public.add_renderer(
  v_subdomain hostname,
  v_domain hostname,
  v_dbname text,
  v_name text DEFAULT null,
  v_database_id uuid DEFAULT null
) returns services_public.services as $$
BEGIN
  RETURN services_public.add_service(
    v_subdomain := v_subdomain,
    v_domain := v_domain,
    v_dbname := v_dbname,
    v_type := 'renderer',
    v_name := v_name,
    v_database_id := v_database_id
  );
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
