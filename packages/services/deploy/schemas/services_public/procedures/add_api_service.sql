-- Deploy schemas/services_public/procedures/add_api_service to pg

-- requires: schemas/services_public/schema
-- requires: schemas/services_public/tables/services/table
-- requires: schemas/services_public/procedures/add_service 
-- requires: schemas/services_public/procedures/add_plugin

BEGIN;

CREATE FUNCTION services_public.add_api_service(
  v_subdomain hostname,
  v_domain hostname,
  v_dbname text,
  v_role_name text,
  v_anon_role text,
  v_schemas text[],
  v_name text DEFAULT null,
  v_database_id uuid DEFAULT null
) returns services_public.services as $$
DECLARE
  svc services_public.services;
  datum jsonb = '{}'::jsonb;
BEGIN

  svc = services_public.add_service(
    v_subdomain := v_subdomain,
    v_domain := v_domain,
    v_dbname := v_dbname,
    v_type := 'api',
    v_name := v_name,
    v_database_id := v_database_id
  );

  datum = jsonb_set(
    datum,
    ARRAY['role_name']::text[],
    to_jsonb(v_role_name)
  );

  datum = jsonb_set(
    datum,
    ARRAY['anon_role']::text[],
    to_jsonb(v_anon_role)
  );

  datum = jsonb_set(
    datum,
    ARRAY['schemas']::text[],
    to_jsonb(v_schemas)
  );

  svc = services_public.add_plugin(
    v_subdomain := v_subdomain,
    v_domain := v_domain,
    v_name := 'graphile',
    v_data := datum
  );

  RETURN svc;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
