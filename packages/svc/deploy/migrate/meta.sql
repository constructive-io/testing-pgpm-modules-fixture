-- Deploy: migrate/meta to pg
-- made with <3 @ launchql.com



BEGIN;
SET session_replication_role TO replica;
-- using replica in case we are deploying triggers to collections_public

DO $LQLMIGRATION$
  DECLARE
  BEGIN
  
    EXECUTE format('GRANT CONNECT ON DATABASE %I TO %I', current_database(), 'app_user');
    EXECUTE format('GRANT CONNECT ON DATABASE %I TO %I', current_database(), 'app_admin');

  END;
$LQLMIGRATION$;



INSERT INTO collections_public.database ( id, owner_id, name ) VALUES ('d822dcfb-2f04-4d8c-a315-6818a521f1e9', NULL, 'rls');

INSERT INTO collections_public.schema ( id, database_id, name, schema_name, description ) VALUES ('2c6f66ff-926f-429c-bdbd-2a9a4e1045bd', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'collections_public', 'collections_public', NULL), ('7c8d7cf6-4bbb-49b1-cd67-40cc976bb729', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'public', 'rls_public', NULL), ('7c8d1ab7-00ec-4d0b-3f99-255ad73b0074', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'private', 'rls_private', NULL), ('7c8d6fb0-1d70-4876-e93f-3081ff127e82', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'simple_secrets', 'rls_simple_secrets', NULL), ('7c8d15ce-e986-4b55-b275-e3abc21227aa', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'roles_private', 'rls_roles_private', NULL), ('7c8d4ba0-581b-4135-7dd7-1f4e45803681', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'encrypted', 'rls_encrypted', NULL), ('7c8d00cf-5fe1-441b-6950-b20fa784c5ee', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'roles_public', 'rls_roles_public', NULL);

INSERT INTO meta_public.domains ( id, database_id, site_id, api_id, domain, subdomain ) VALUES ('927cf1d0-5243-4857-ae4d-5697f729c232', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', NULL, 'cbc5706a-15a6-40b8-a42c-e43afde827ce', 'lql.io', 'api'), ('7eea3552-8703-4ed2-a501-d193cbc0c8c0', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', NULL, '7063d6c3-4562-4975-8b06-df497cc4df64', 'lql.io', 'admin'), ('4d4c125a-c19f-4eaf-94bb-2dfe1585d908', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', NULL, '9072a5c3-7a9e-4bb9-812a-1abb9546b940', 'lql.io', 'meta'), ('e0b206d7-b415-4d87-a94d-5e439cd1b700', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', NULL, '22f877e8-c143-40a2-8e99-08d4de914569', 'launchql-admin', NULL), ('eb6db801-e057-4f1c-834e-67768a66f2e2', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', NULL, '79d06c12-f147-411f-a7f8-18b5c7f0b223', 'cluster.local', 'launchql-admin-service.webinc.svc'), ('c7ebee2c-0dc8-4976-9dab-f58274e82184', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '0bcb73d8-c145-4561-b0e2-92be359a021b', NULL, 'lql.io', 'app');

INSERT INTO meta_public.apis ( id, database_id, name, dbname, is_public, role_name, anon_role ) VALUES ('cbc5706a-15a6-40b8-a42c-e43afde827ce', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'public', 'testing-db-1609205350311', TRUE, 'authenticated', 'anonymous'), ('13cc26f6-e9e1-4c8b-9802-90e9b0cffb91', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'private', 'testing-db-1609205350311', FALSE, 'administrator', 'administrator'), ('7063d6c3-4562-4975-8b06-df497cc4df64', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'admin', 'testing-db-1609205350311', TRUE, 'administrator', 'administrator'), ('9072a5c3-7a9e-4bb9-812a-1abb9546b940', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'meta', 'testing-db-1609205350311', FALSE, 'administrator', 'administrator'), ('22f877e8-c143-40a2-8e99-08d4de914569', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'jobs-admin-docker-compose', 'testing-db-1609205350311', FALSE, 'administrator', 'administrator'), ('79d06c12-f147-411f-a7f8-18b5c7f0b223', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'jobs-admin-k8s', 'testing-db-1609205350311', FALSE, 'administrator', 'administrator');

INSERT INTO meta_public.sites ( id, database_id, title, description, og_image, favicon, apple_touch_icon, logo, dbname ) VALUES ('0bcb73d8-c145-4561-b0e2-92be359a021b', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'LaunchQL', 'Build the last api you''ll ever need', '{"url":"https://dl.airtable.com/.attachments/7c46ed8152a409426030d946ad969c9a/28414bd4/og-image.png","mime":"image/png"}', 'https://dl.airtable.com/.attachments/95baabecef8ba8a42cc598c9e835f01f/bb75f5f7/favicon.ico', '{"url":"https://dl.airtable.com/.attachments/0a9a6f3084e63f7423dbf6d6ccdc1182/42690404/apple-touch-icon.png","mime":"image/png"}', '{"url":"https://dl.airtable.com/.attachments/2604e98b1a3a00d2aa2fe72112cb4436/5f328a5a/logo-blue-outlines.svg","mime":"image/png"}', 'testing-db-1609205350311');

INSERT INTO meta_public.api_modules ( id, database_id, api_id, name, data ) VALUES ('6fc7fffe-11d5-496d-bdbc-2f83d455029a', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'cbc5706a-15a6-40b8-a42c-e43afde827ce', 'rls_module', '{"role_schema":"rls_roles_public","authenticate":"authenticate","current_role":"get_current_user","current_role_id":"get_current_user_id","current_group_ids":"get_current_group_ids","current_ip_address":"current_ip_address","current_user_agent":"current_user_agent","authenticate_schema":"rls_roles_private"}');

INSERT INTO meta_public.site_modules ( id, database_id, site_id, name, data ) VALUES ('e561c265-5c1e-4f93-ba5a-15ea6995b1e7', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '0bcb73d8-c145-4561-b0e2-92be359a021b', 'legal_terms_module', '{"site":{"www":"launchql.com","host":"app.lql.io","siteUrl":"https://app.lql.io"},"emails":{"abuse":"abuse@launchql.com","hello":"hello@launchql.com","legal":"legal@launchql.com","privacy":"privacy@launchql.com","support":"support@launchql.com","copyright":"copyright@launchql.com","arbitrationOptOut":"arbitration-opt-out@launchql.com"},"company":{"addr":["1830 Palisades Dr","Los Angeles, CA 90272"],"name":"Web, Inc.","nick":"LaunchQL","website":"https://launchql.com/","legalState":"California","legalCounty":"Los Angeles"}}'), ('7fa269ea-cd8d-4007-beb9-c728ad605fbb', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '0bcb73d8-c145-4561-b0e2-92be359a021b', 'user_auth_module', '{"sign_in":"login","sign_up":"register","sign_out":"logout","auth_schema":"rls_roles_public","set_password":"set_password","verify_email":"verify_email","reset_password":"reset_password","forgot_password":"forgot_password","send_verification_email":"send_verification_email"}');

INSERT INTO meta_public.site_themes ( id, database_id, site_id, theme ) VALUES ('c1499cd9-76e0-479d-a5bd-107d98a274eb', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '0bcb73d8-c145-4561-b0e2-92be359a021b', '{"colors":["#66d9ff","#91d5ee","#ffffff","#33CCFF"],"primary":"#01A1FF","background":"#f2fafd"}');

INSERT INTO meta_public.apps ( id, database_id, site_id, name, app_image, app_store_link, app_store_id, app_id_prefix, play_store_link ) VALUES ('65675c88-3ac5-4580-b532-ed011e08bee3', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '0bcb73d8-c145-4561-b0e2-92be359a021b', 'LaunchQL', '{"url":"https://dl.airtable.com/.attachments/a56ba62f3d20c92b89948a9d952b9c25/3c782309/white-logo.svg","mime":"image/png"}', 'https://google.com', '909090', NULL, NULL);

INSERT INTO meta_public.api_extensions ( id, database_id, api_id, schema_name ) VALUES ('0b7668ac-1798-406f-a785-f889434b8dca', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '9072a5c3-7a9e-4bb9-812a-1abb9546b940', 'meta_public'), ('2aafd7b3-763a-45e7-bcd6-d53b816a184c', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '9072a5c3-7a9e-4bb9-812a-1abb9546b940', 'collections_public');

INSERT INTO meta_public.api_schemata ( id, database_id, schema_id, api_id ) VALUES ('ea919e15-462e-4c97-8f8f-fb97d5f20fcd', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d7cf6-4bbb-49b1-cd67-40cc976bb729', 'cbc5706a-15a6-40b8-a42c-e43afde827ce'), ('9868fce0-8044-4d52-a7f9-05b2f24f2c65', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d7cf6-4bbb-49b1-cd67-40cc976bb729', '13cc26f6-e9e1-4c8b-9802-90e9b0cffb91'), ('f37358c4-c321-4c7a-9f7b-3959b200cd4f', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d1ab7-00ec-4d0b-3f99-255ad73b0074', '13cc26f6-e9e1-4c8b-9802-90e9b0cffb91'), ('1aed229f-4755-46cb-a848-91b152948ceb', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d7cf6-4bbb-49b1-cd67-40cc976bb729', '7063d6c3-4562-4975-8b06-df497cc4df64'), ('0e2ce112-63f6-4619-83b3-77ba87074fc4', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d1ab7-00ec-4d0b-3f99-255ad73b0074', '7063d6c3-4562-4975-8b06-df497cc4df64'), ('5375d392-52c0-49d2-ada1-3464186c99b7', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d7cf6-4bbb-49b1-cd67-40cc976bb729', '22f877e8-c143-40a2-8e99-08d4de914569'), ('16b0d1f9-5af3-4077-bd20-07c898ba036f', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d1ab7-00ec-4d0b-3f99-255ad73b0074', '22f877e8-c143-40a2-8e99-08d4de914569'), ('e92ae4c4-cd57-4f0d-91bc-5bb3770ef6ae', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d7cf6-4bbb-49b1-cd67-40cc976bb729', '79d06c12-f147-411f-a7f8-18b5c7f0b223'), ('780c46e4-6ad7-446a-8ef4-5a6e84fe84e2', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d1ab7-00ec-4d0b-3f99-255ad73b0074', '79d06c12-f147-411f-a7f8-18b5c7f0b223'), ('edf29ab9-49fc-4fa9-8e3e-52bab4831eb7', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d00cf-5fe1-441b-6950-b20fa784c5ee', 'cbc5706a-15a6-40b8-a42c-e43afde827ce'), ('f1b84402-1d84-4f7d-8881-93b7e5c7077a', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d00cf-5fe1-441b-6950-b20fa784c5ee', '7063d6c3-4562-4975-8b06-df497cc4df64');

INSERT INTO meta_public.rls_module ( id, database_id, api_id, schema_id, private_schema_id, tokens_table_id, users_table_id, authenticate, "current_role", current_role_id, current_group_ids ) VALUES ('87fad128-8c31-4627-becf-e94dc13ecd5b', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', 'cbc5706a-15a6-40b8-a42c-e43afde827ce', '7c8d00cf-5fe1-441b-6950-b20fa784c5ee', '7c8d15ce-e986-4b55-b275-e3abc21227aa', '7c8d72cd-cf06-4506-67e9-351407640a03', '7c8dff90-3653-4f0f-af22-61c5df96c861', 'authenticate', 'get_current_user', 'get_current_user_id', 'get_current_group_ids');

INSERT INTO meta_public.user_auth_module ( id, database_id, schema_id, emails_table_id, users_table_id, secrets_table_id, encrypted_table_id, tokens_table_id, sign_in_function, sign_up_function, sign_out_function, set_password_function, reset_password_function, forgot_password_function, send_verification_email_function, verify_email_function ) VALUES ('4d965e73-848a-48ca-942d-86be797ea30e', 'd822dcfb-2f04-4d8c-a315-6818a521f1e9', '7c8d00cf-5fe1-441b-6950-b20fa784c5ee', '7c8d8afd-5ca0-4f9b-2b90-a0f5fb1cc672', '7c8dff90-3653-4f0f-af22-61c5df96c861', '7c8d2da8-0091-4523-ed6a-ed2eaf39c079', '7c8d14f5-5a71-42cb-eef4-01fd6ccc5077', '7c8d72cd-cf06-4506-67e9-351407640a03', 'login', 'register', 'logout', 'set_password', 'reset_password', 'forgot_password', 'send_verification_email', 'verify_email');

UPDATE meta_public.apis
      SET dbname = current_database() WHERE TRUE;

UPDATE meta_public.sites
      SET dbname = current_database() WHERE TRUE;

SET session_replication_role TO DEFAULT;

COMMIT;
