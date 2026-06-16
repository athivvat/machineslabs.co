--
-- PostgreSQL database dump
--

\restrict oowQKmlgA8jnpzv5cexhW4I9cr6UCNYfp3Vurwfu3CWGgVb6OKn2caIsGIlzgr4

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3 (Debian 18.3-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: cms; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cms;


ALTER SCHEMA cms OWNER TO postgres;

--
-- Name: drizzle; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA drizzle;


ALTER SCHEMA drizzle OWNER TO postgres;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: enum__posts_v_version_status; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum__posts_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE cms.enum__posts_v_version_status OWNER TO postgres;

--
-- Name: enum__projects_v_version_status; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum__projects_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE cms.enum__projects_v_version_status OWNER TO postgres;

--
-- Name: enum_payload_jobs_log_state; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum_payload_jobs_log_state AS ENUM (
    'failed',
    'succeeded'
);


ALTER TYPE cms.enum_payload_jobs_log_state OWNER TO postgres;

--
-- Name: enum_payload_jobs_log_task_slug; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum_payload_jobs_log_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


ALTER TYPE cms.enum_payload_jobs_log_task_slug OWNER TO postgres;

--
-- Name: enum_payload_jobs_task_slug; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum_payload_jobs_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


ALTER TYPE cms.enum_payload_jobs_task_slug OWNER TO postgres;

--
-- Name: enum_posts_status; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum_posts_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE cms.enum_posts_status OWNER TO postgres;

--
-- Name: enum_projects_status; Type: TYPE; Schema: cms; Owner: postgres
--

CREATE TYPE cms.enum_projects_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE cms.enum_projects_status OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
begin
    if not exists (
        select 1
        from pg_event_trigger_ddl_commands() ev
        join pg_catalog.pg_extension e on ev.objid = e.oid
        where e.extname = 'pg_graphql'
    ) then
        return;
    end if;

    drop function if exists graphql_public.graphql;
    create or replace function graphql_public.graphql(
        "operationName" text default null,
        query text default null,
        variables jsonb default null,
        extensions jsonb default null
    )
        returns jsonb
        language sql
    as $$
        select graphql.resolve(
            query := query,
            variables := coalesce(variables, '{}'),
            "operationName" := "operationName",
            extensions := extensions
        );
    $$;

    -- Attach the wrapper to the extension so DROP EXTENSION cascades to it,
    -- which in turn triggers set_graphql_placeholder to reinstall the "not enabled" stub.
    alter extension pg_graphql add function graphql_public.graphql(text, text, jsonb, jsonb);

    grant usage on schema graphql to postgres, anon, authenticated, service_role;
    grant execute on function graphql.resolve to postgres, anon, authenticated, service_role;
    grant usage on schema graphql to postgres with grant option;
    grant usage on schema graphql_public to postgres with grant option;
end;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: supabase_admin
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


ALTER FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) OWNER TO supabase_admin;

--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
    -- Regclass of the table e.g. public.notes
    entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

    -- I, U, D, T: insert, update ...
    action realtime.action = (
        case wal ->> 'action'
            when 'I' then 'INSERT'
            when 'U' then 'UPDATE'
            when 'D' then 'DELETE'
            else 'ERROR'
        end
    );

    -- Is row level security enabled for the table
    is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

    subscriptions realtime.subscription[] = array_agg(subs)
        from
            realtime.subscription subs
        where
            subs.entity = entity_
            -- Filter by action early - only get subscriptions interested in this action
            -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
            and (subs.action_filter = '*' or subs.action_filter = action::text);

    -- Subscription vars
    working_role regrole;
    working_selected_columns text[];
    claimed_role regrole;
    claims jsonb;

    subscription_id uuid;
    subscription_has_access bool;
    visible_to_subscription_ids uuid[] = '{}';

    -- structured info for wal's columns
    columns realtime.wal_column[];
    -- previous identity values for update/delete
    old_columns realtime.wal_column[];

    error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

    -- Primary jsonb output for record
    output jsonb;

    -- Loop record for iterating unique roles (outer loop)
    role_record record;
    -- Loop record for iterating unique selected_columns within a role (inner loop)
    cols_record record;
    -- Subscription ids visible at the role level (before fanning out by selected_columns)
    visible_role_sub_ids uuid[] = '{}';

begin
    perform set_config('role', null, true);

    columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'columns') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    old_columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'identity') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    for role_record in
        select claims_role
        from (select distinct claims_role from unnest(subscriptions)) t
        order by claims_role::text
    loop
        working_role := role_record.claims_role;

        -- Update `is_selectable` for columns and old_columns (once per role)
        columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(columns) c;

        old_columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(old_columns) c;

        if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
            -- Fan out 400 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;
            end loop;

        -- The claims role does not have SELECT permission to the primary key of entity
        elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
            -- Fan out 401 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;
            end loop;

        else
            -- Create the prepared statement (once per role)
            if is_rls_enabled and action <> 'DELETE' then
                if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                    deallocate walrus_rls_stmt;
                end if;
                execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
            end if;

            -- Collect all visible subscription IDs for this role (filter check + RLS check)
            visible_role_sub_ids = '{}';

            for subscription_id, claims in (
                    select
                        subs.subscription_id,
                        subs.claims
                    from
                        unnest(subscriptions) subs
                    where
                        subs.entity = entity_
                        and subs.claims_role = working_role
                        and (
                            realtime.is_visible_through_filters(columns, subs.filters)
                            or (
                              action = 'DELETE'
                              and realtime.is_visible_through_filters(old_columns, subs.filters)
                            )
                        )
            ) loop

                if not is_rls_enabled or action = 'DELETE' then
                    visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                else
                    -- Check if RLS allows the role to see the record
                    perform
                        -- Trim leading and trailing quotes from working_role because set_config
                        -- doesn't recognize the role as valid if they are included
                        set_config('role', trim(both '"' from working_role::text), true),
                        set_config('request.jwt.claims', claims::text, true);

                    execute 'execute walrus_rls_stmt' into subscription_has_access;

                    if subscription_has_access then
                        visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                    end if;
                end if;
            end loop;

            perform set_config('role', null, true);

            -- Inner loop: per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;

                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                            left join (
                                select unnest(conkey) as pkey_attnum
                                from pg_constraint
                                where conrelid = entity_ and contype = 'p'
                            ) pk on pk.pkey_attnum = pa.attnum
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                            and (working_selected_columns is null or pa.attname = any(working_selected_columns) or pk.pkey_attnum is not null)
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and (working_selected_columns is null or coalesce((c).name, (oc).name) = any(working_selected_columns) or coalesce((c).is_pkey, (oc).is_pkey))
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Filter visible_role_sub_ids to those matching the current selected_columns group
                visible_to_subscription_ids = coalesce(
                    (
                        select array_agg(s.subscription_id)
                        from unnest(subscriptions) s
                        where s.claims_role = working_role
                          and (s.selected_columns is not distinct from working_selected_columns)
                          and s.subscription_id = any(visible_role_sub_ids)
                    ),
                    '{}'::uuid[]
                );

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;
            end loop;

        end if;
    end loop;

    perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  SELECT
    realtime.wal2json_escape_identifier(nsp.nspname::text)
    || '.'
    || realtime.wal2json_escape_identifier(pc.relname::text)
  FROM pg_class pc
  JOIN pg_namespace nsp ON pc.relnamespace = nsp.oid
  WHERE pc.oid = entity
$$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: send_binary(bytea, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, binary_payload, event, topic, private, extension)
    VALUES (generated_id, payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
    col_names text[] = coalesce(
            array_agg(a.attname order by a.attnum),
            '{}'::text[]
        )
        from
            pg_catalog.pg_attribute a
        where
            a.attrelid = new.entity
            and a.attnum > 0
            and not a.attisdropped
            and pg_catalog.has_column_privilege(
                (new.claims ->> 'role'),
                a.attrelid,
                a.attnum,
                'SELECT'
            );
    filter realtime.user_defined_filter;
    col_type regtype;
    in_val jsonb;
    selected_col text;
begin
    for filter in select * from unnest(new.filters) loop
        if not filter.column_name = any(col_names) then
            raise exception 'invalid column for filter %', filter.column_name;
        end if;

        col_type = (
            select atttypid::regtype
            from pg_catalog.pg_attribute
            where attrelid = new.entity
                  and attname = filter.column_name
        );
        if col_type is null then
            raise exception 'failed to lookup type for column %', filter.column_name;
        end if;

        if filter.op = 'in'::realtime.equality_op then
            in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
            if coalesce(jsonb_array_length(in_val), 0) > 100 then
                raise exception 'too many values for `in` filter. Maximum 100';
            end if;
        else
            perform realtime.cast(filter.value, col_type);
        end if;
    end loop;

    if new.selected_columns is not null then
        for selected_col in select * from unnest(new.selected_columns) loop
            if not selected_col = any(col_names) then
                raise exception 'invalid column for select %', selected_col;
            end if;
        end loop;
    end if;

    new.filters = coalesce(
        array_agg(f order by f.column_name, f.op, f.value),
        '{}'
    ) from unnest(new.filters) f;

    new.selected_columns = (
        select array_agg(c order by c)
        from unnest(new.selected_columns) c
    );

    return new;
end;
$$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: wal2json_escape_identifier(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.wal2json_escape_identifier(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  -- Prefix `\`, `,`, `.`, and any whitespace with `\`
  SELECT regexp_replace(name, '([\\,.[:space:]])', '\\\1', 'g')
$$;


ALTER FUNCTION realtime.wal2json_escape_identifier(name text) OWNER TO supabase_admin;

--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

--
-- Name: _posts_v; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms._posts_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_sub_title character varying,
    version_excerpt character varying,
    version_feature_image_image_id integer,
    version_feature_image_caption character varying,
    version_feature_image_credits character varying,
    version_body jsonb,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status cms.enum__posts_v_version_status DEFAULT 'draft'::cms.enum__posts_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    version_published_at timestamp(3) with time zone
);


ALTER TABLE cms._posts_v OWNER TO postgres;

--
-- Name: _posts_v_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms._posts_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms._posts_v_id_seq OWNER TO postgres;

--
-- Name: _posts_v_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms._posts_v_id_seq OWNED BY cms._posts_v.id;


--
-- Name: _posts_v_rels; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms._posts_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    categories_id integer,
    tags_id integer
);


ALTER TABLE cms._posts_v_rels OWNER TO postgres;

--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms._posts_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms._posts_v_rels_id_seq OWNER TO postgres;

--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms._posts_v_rels_id_seq OWNED BY cms._posts_v_rels.id;


--
-- Name: _projects_v; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms._projects_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_sub_title character varying,
    version_excerpt character varying,
    version_feature_image_image_id integer,
    version_feature_image_caption character varying,
    version_feature_image_credits character varying,
    version_body jsonb,
    version_parts_used jsonb,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status cms.enum__projects_v_version_status DEFAULT 'draft'::cms.enum__projects_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    version_published_at timestamp(3) with time zone
);


ALTER TABLE cms._projects_v OWNER TO postgres;

--
-- Name: _projects_v_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms._projects_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms._projects_v_id_seq OWNER TO postgres;

--
-- Name: _projects_v_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms._projects_v_id_seq OWNED BY cms._projects_v.id;


--
-- Name: _projects_v_rels; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms._projects_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    categories_id integer,
    tags_id integer
);


ALTER TABLE cms._projects_v_rels OWNER TO postgres;

--
-- Name: _projects_v_rels_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms._projects_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms._projects_v_rels_id_seq OWNER TO postgres;

--
-- Name: _projects_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms._projects_v_rels_id_seq OWNED BY cms._projects_v_rels.id;


--
-- Name: categories; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE cms.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.categories_id_seq OWNED BY cms.categories.id;


--
-- Name: media; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.media (
    id integer NOT NULL,
    alt character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric,
    prefix character varying
);


ALTER TABLE cms.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.media_id_seq OWNED BY cms.media.id;


--
-- Name: payload_jobs; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_jobs (
    id integer NOT NULL,
    input jsonb,
    completed_at timestamp(3) with time zone,
    total_tried numeric DEFAULT 0,
    has_error boolean DEFAULT false,
    error jsonb,
    task_slug cms.enum_payload_jobs_task_slug,
    queue character varying DEFAULT 'default'::character varying,
    wait_until timestamp(3) with time zone,
    processing boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE cms.payload_jobs OWNER TO postgres;

--
-- Name: payload_jobs_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_jobs_id_seq OWNER TO postgres;

--
-- Name: payload_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_jobs_id_seq OWNED BY cms.payload_jobs.id;


--
-- Name: payload_jobs_log; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_jobs_log (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    executed_at timestamp(3) with time zone NOT NULL,
    completed_at timestamp(3) with time zone NOT NULL,
    task_slug cms.enum_payload_jobs_log_task_slug NOT NULL,
    task_i_d character varying NOT NULL,
    input jsonb,
    output jsonb,
    state cms.enum_payload_jobs_log_state NOT NULL,
    error jsonb
);


ALTER TABLE cms.payload_jobs_log OWNER TO postgres;

--
-- Name: payload_kv; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_kv (
    id integer NOT NULL,
    key character varying NOT NULL,
    data jsonb NOT NULL
);


ALTER TABLE cms.payload_kv OWNER TO postgres;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_kv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_kv_id_seq OWNER TO postgres;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_kv_id_seq OWNED BY cms.payload_kv.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE cms.payload_locked_documents OWNER TO postgres;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_locked_documents_id_seq OWNER TO postgres;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_locked_documents_id_seq OWNED BY cms.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    tags_id integer,
    media_id integer,
    users_id integer,
    projects_id integer
);


ALTER TABLE cms.payload_locked_documents_rels OWNER TO postgres;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_locked_documents_rels_id_seq OWNER TO postgres;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_locked_documents_rels_id_seq OWNED BY cms.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE cms.payload_migrations OWNER TO postgres;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_migrations_id_seq OWNER TO postgres;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_migrations_id_seq OWNED BY cms.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE cms.payload_preferences OWNER TO postgres;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_preferences_id_seq OWNER TO postgres;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_preferences_id_seq OWNED BY cms.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE cms.payload_preferences_rels OWNER TO postgres;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.payload_preferences_rels_id_seq OWNER TO postgres;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.payload_preferences_rels_id_seq OWNED BY cms.payload_preferences_rels.id;


--
-- Name: posts; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.posts (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    sub_title character varying,
    excerpt character varying,
    feature_image_image_id integer,
    feature_image_caption character varying,
    feature_image_credits character varying,
    body jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status cms.enum_posts_status DEFAULT 'draft'::cms.enum_posts_status,
    published_at timestamp(3) with time zone
);


ALTER TABLE cms.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.posts_id_seq OWNED BY cms.posts.id;


--
-- Name: posts_rels; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.posts_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    categories_id integer,
    tags_id integer
);


ALTER TABLE cms.posts_rels OWNER TO postgres;

--
-- Name: posts_rels_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.posts_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.posts_rels_id_seq OWNER TO postgres;

--
-- Name: posts_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.posts_rels_id_seq OWNED BY cms.posts_rels.id;


--
-- Name: projects; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.projects (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    sub_title character varying,
    excerpt character varying,
    feature_image_image_id integer,
    feature_image_caption character varying,
    feature_image_credits character varying,
    body jsonb,
    parts_used jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status cms.enum_projects_status DEFAULT 'draft'::cms.enum_projects_status,
    published_at timestamp(3) with time zone
);


ALTER TABLE cms.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.projects_id_seq OWNED BY cms.projects.id;


--
-- Name: projects_rels; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.projects_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    categories_id integer,
    tags_id integer
);


ALTER TABLE cms.projects_rels OWNER TO postgres;

--
-- Name: projects_rels_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.projects_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.projects_rels_id_seq OWNER TO postgres;

--
-- Name: projects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.projects_rels_id_seq OWNED BY cms.projects_rels.id;


--
-- Name: tags; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.tags (
    id integer NOT NULL,
    title character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE cms.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.tags_id_seq OWNED BY cms.tags.id;


--
-- Name: users; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.users (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


ALTER TABLE cms.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: cms; Owner: postgres
--

CREATE SEQUENCE cms.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cms.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: cms; Owner: postgres
--

ALTER SEQUENCE cms.users_id_seq OWNED BY cms.users.id;


--
-- Name: users_sessions; Type: TABLE; Schema: cms; Owner: postgres
--

CREATE TABLE cms.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


ALTER TABLE cms.users_sessions OWNER TO postgres;

--
-- Name: __drizzle_migrations; Type: TABLE; Schema: drizzle; Owner: postgres
--

CREATE TABLE drizzle.__drizzle_migrations (
    id integer NOT NULL,
    hash text NOT NULL,
    created_at bigint
);


ALTER TABLE drizzle.__drizzle_migrations OWNER TO postgres;

--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE; Schema: drizzle; Owner: postgres
--

CREATE SEQUENCE drizzle.__drizzle_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNER TO postgres;

--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: drizzle; Owner: postgres
--

ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNED BY drizzle.__drizzle_migrations.id;


--
-- Name: auth_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_account (
    id text NOT NULL,
    account_id text NOT NULL,
    provider_id text NOT NULL,
    user_id text NOT NULL,
    access_token text,
    refresh_token text,
    id_token text,
    access_token_expires_at timestamp without time zone,
    refresh_token_expires_at timestamp without time zone,
    scope text,
    password text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.auth_account OWNER TO postgres;

--
-- Name: auth_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_session (
    id text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    token text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ip_address text,
    user_agent text,
    user_id text NOT NULL
);


ALTER TABLE public.auth_session OWNER TO postgres;

--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    email_verified boolean DEFAULT false NOT NULL,
    image text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_verification (
    id text NOT NULL,
    identifier text NOT NULL,
    value text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.auth_verification OWNER TO postgres;

--
-- Name: lms_certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lms_certificate (
    id text NOT NULL,
    user_id text NOT NULL,
    course_id text NOT NULL,
    certificate_code text NOT NULL,
    issued_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.lms_certificate OWNER TO postgres;

--
-- Name: lms_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lms_courses (
    id text NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    summary text,
    description text,
    thumbnail_url text,
    platform text DEFAULT 'local'::text NOT NULL,
    udemy_url text,
    price integer,
    published boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    coming_soon boolean DEFAULT false NOT NULL,
    intended_learners jsonb,
    learning_objectives jsonb,
    requirements jsonb
);


ALTER TABLE public.lms_courses OWNER TO postgres;

--
-- Name: lms_enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lms_enrollment (
    id text NOT NULL,
    user_id text NOT NULL,
    course_id text NOT NULL,
    status text DEFAULT 'active'::text NOT NULL,
    progress integer DEFAULT 0 NOT NULL,
    enrolled_at timestamp with time zone DEFAULT now() NOT NULL,
    completed_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.lms_enrollment OWNER TO postgres;

--
-- Name: lms_lesson_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lms_lesson_progress (
    id text NOT NULL,
    user_id text NOT NULL,
    course_id text NOT NULL,
    lesson_id text NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    completed_at timestamp with time zone,
    last_accessed_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.lms_lesson_progress OWNER TO postgres;

--
-- Name: lms_lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lms_lessons (
    id text NOT NULL,
    course_id text NOT NULL,
    module_id text NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    type text DEFAULT 'video'::text NOT NULL,
    content text,
    video_url text,
    duration integer,
    is_free_preview boolean DEFAULT false NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.lms_lessons OWNER TO postgres;

--
-- Name: lms_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lms_modules (
    id text NOT NULL,
    course_id text NOT NULL,
    title text NOT NULL,
    description text,
    "order" integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.lms_modules OWNER TO postgres;

--
-- Name: store_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_product (
    id text NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    price integer NOT NULL,
    sku text,
    image text,
    description text,
    category text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_product OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    selected_columns text[],
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: _posts_v id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v ALTER COLUMN id SET DEFAULT nextval('cms._posts_v_id_seq'::regclass);


--
-- Name: _posts_v_rels id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v_rels ALTER COLUMN id SET DEFAULT nextval('cms._posts_v_rels_id_seq'::regclass);


--
-- Name: _projects_v id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v ALTER COLUMN id SET DEFAULT nextval('cms._projects_v_id_seq'::regclass);


--
-- Name: _projects_v_rels id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v_rels ALTER COLUMN id SET DEFAULT nextval('cms._projects_v_rels_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.categories ALTER COLUMN id SET DEFAULT nextval('cms.categories_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.media ALTER COLUMN id SET DEFAULT nextval('cms.media_id_seq'::regclass);


--
-- Name: payload_jobs id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_jobs ALTER COLUMN id SET DEFAULT nextval('cms.payload_jobs_id_seq'::regclass);


--
-- Name: payload_kv id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_kv ALTER COLUMN id SET DEFAULT nextval('cms.payload_kv_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('cms.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('cms.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_migrations ALTER COLUMN id SET DEFAULT nextval('cms.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_preferences ALTER COLUMN id SET DEFAULT nextval('cms.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('cms.payload_preferences_rels_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts ALTER COLUMN id SET DEFAULT nextval('cms.posts_id_seq'::regclass);


--
-- Name: posts_rels id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts_rels ALTER COLUMN id SET DEFAULT nextval('cms.posts_rels_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects ALTER COLUMN id SET DEFAULT nextval('cms.projects_id_seq'::regclass);


--
-- Name: projects_rels id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects_rels ALTER COLUMN id SET DEFAULT nextval('cms.projects_rels_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.tags ALTER COLUMN id SET DEFAULT nextval('cms.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.users ALTER COLUMN id SET DEFAULT nextval('cms.users_id_seq'::regclass);


--
-- Name: __drizzle_migrations id; Type: DEFAULT; Schema: drizzle; Owner: postgres
--

ALTER TABLE ONLY drizzle.__drizzle_migrations ALTER COLUMN id SET DEFAULT nextval('drizzle.__drizzle_migrations_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: _posts_v; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms._posts_v (id, parent_id, version_title, version_slug, version_sub_title, version_excerpt, version_feature_image_image_id, version_feature_image_caption, version_feature_image_credits, version_body, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, version_published_at) FROM stdin;
1	3	เครื่องพิมพ์ 3D คืออะไร?	3d-printing-for-beginners-what-is-3d-printing	เครื่องพิมพ์ 3D สำหรับมือใหม่ · ตอนที่ 1	ทำความรู้จักเครื่องพิมพ์ 3D สำหรับมือใหม่ ว่าคืออะไร ทำงานอย่างไรด้วยหลักการสร้างทีละชั้น (Additive Manufacturing) และขั้นตอนคร่าว ๆ จากไอเดียสู่ของจริง	12	เครื่องพิมพ์ 3D พร้อมเครื่องมือและชิ้นงานในเวิร์กชอป		{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ซีรีส์เรียนรู้เครื่องพิมพ์ 3D ตั้งแต่ศูนย์ สำหรับคนที่ไม่เคยจับมาก่อน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพว่าคุณวาดของเล่นชิ้นหนึ่งบนคอมพิวเตอร์ แล้วกดปุ่มเดียว อีกไม่กี่ชั่วโมงต่อมาของชิ้นนั้นก็โผล่ออกมาเป็นวัตถุจริงที่จับต้องได้ วางบนฝ่ามือได้ นี่ไม่ใช่เรื่องในหนังวิทยาศาสตร์อีกต่อไป แต่คือสิ่งที่เครื่องพิมพ์ 3D ราคาหลักพันบาททำได้ในห้องนอนของคุณ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ในตอนแรกของซีรีส์นี้ เราจะปูพื้นฐานให้เข้าใจว่าเครื่องพิมพ์ 3D คืออะไร ทำงานอย่างไร และทำไมมันถึงเปลี่ยนวิธีที่เราสร้างสิ่งของไปอย่างสิ้นเชิง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " เครื่องพิมพ์ 3D คืออะไร", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องพิมพ์ 3D คืออุปกรณ์ที่สร้างวัตถุสามมิติขึ้นมาจากไฟล์ดิจิทัล โดยการ \\"เติม\\" วัสดุทีละน้อยจนกลายเป็นรูปร่างที่ต้องการ คำที่ใช้ในวงการคือ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Additive Manufacturing", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หรือ \\"การผลิตแบบเติมเนื้อ\\" ซึ่งเป็นหัวใจสำคัญที่ทำให้มันต่างจากเครื่องจักรแบบเดิม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "6a26ef3ffa2feba8be522feb", "type": "upload", "value": 13, "fields": null, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ชื่อ \\"เครื่องพิมพ์\\" อาจทำให้เข้าใจผิดได้นิดหน่อย เพราะมันไม่ได้พิมพ์ตัวหนังสือลงกระดาษ แต่ถ้ามองในแง่หลักการแล้วก็คล้ายกัน เครื่องพิมพ์กระดาษทั่วไปวางหมึกเป็นจุดเล็ก ๆ จนเกิดเป็นภาพบนพื้นผิวสองมิติ ส่วนเครื่องพิมพ์ 3D ก็วางวัสดุเป็นชั้น ๆ ซ้อนกันขึ้นไปจนเกิดเป็นวัตถุในสามมิติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " หลักการทำงาน: สร้างทีละชั้น", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หัวใจของเครื่องพิมพ์ 3D เกือบทุกชนิดคือแนวคิดเดียวกัน นั่นคือ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "การสร้างวัตถุทีละชั้น (layer by layer)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกถึงขนมเค้กหลายชั้น หรือกองแพนเค้กที่วางซ้อนกัน วัตถุที่พิมพ์ออกมาก็เกิดจากหลักการเดียวกัน เครื่องจะแบ่งโมเดลสามมิติออกเป็นชั้นบาง ๆ แนวนอนหลายร้อยหรือหลายพันชั้น แล้วค่อย ๆ สร้างทีละชั้นจากล่างขึ้นบน เมื่อชั้นหนึ่งเสร็จ เครื่องก็ขยับขึ้นไปเล็กน้อยแล้วเริ่มสร้างชั้นถัดไปทับลงไป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ความบางของแต่ละชั้นเรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ความละเอียดของชั้น (layer height)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " โดยทั่วไปอยู่ที่ประมาณ 0.1 ถึง 0.3 มิลลิเมตร ยิ่งชั้นบาง ผิวงานก็ยิ่งเรียบเนียนและเก็บรายละเอียดได้ดี แต่ก็ใช้เวลาพิมพ์นานขึ้นตามไปด้วย นี่คือการแลกเปลี่ยนที่คุณจะเจอบ่อยมากในโลกของการพิมพ์ 3D คือคุณภาพแลกกับเวลา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ขั้นตอนคร่าว ๆ จากไอเดียสู่ของจริง", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เพื่อให้เห็นภาพรวม กระบวนการพิมพ์ 3D มักประกอบด้วยสามขั้นตอนหลัก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขั้นแรกคือการได้มาซึ่ง ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "โมเดลสามมิติ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ซึ่งอาจมาจากการออกแบบเองด้วยโปรแกรม CAD การสแกนวัตถุจริง หรือดาวน์โหลดไฟล์สำเร็จรูปที่คนอื่นทำไว้แล้ว ไฟล์เหล่านี้มักอยู่ในนามสกุล `.stl` หรือ `.obj`", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขั้นที่สองคือการนำโมเดลไปผ่านโปรแกรมที่เรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Slicer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ซึ่งทำหน้าที่ \\"หั่น\\" โมเดลออกเป็นชั้น ๆ และแปลงเป็นชุดคำสั่งที่เครื่องเข้าใจ เรียกว่า G-code ในขั้นนี้คุณจะกำหนดค่าต่าง ๆ เช่น ความละเอียด ความหนาแน่นภายในชิ้นงาน และความเร็วในการพิมพ์", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขั้นที่สามคือการส่ง G-code เข้าเครื่องแล้ว ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เริ่มพิมพ์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " จากนั้นก็รอให้เครื่องค่อย ๆ สร้างชิ้นงานขึ้นมาทีละชั้นจนเสร็จสมบูรณ์", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราจะลงรายละเอียดของแต่ละขั้นตอนนี้ในตอนต่อ ๆ ไป ตอนนี้แค่ให้เห็นภาพรวมก็พอ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมเครื่องพิมพ์ 3D ถึงน่าสนใจ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สิ่งที่ทำให้เทคโนโลยีนี้พิเศษคือมันเปิดโอกาสให้คนธรรมดาผลิตของใช้เองได้ โดยไม่ต้องพึ่งโรงงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสามารถสร้างของที่ไม่มีขายในท้องตลาด เช่น อะไหล่พลาสติกชิ้นเล็ก ๆ ที่หักไป ที่วางของแบบเฉพาะตัว หรือของเล่นตามจินตนาการ การผลิตทีละชิ้นแบบนี้ในแบบเดิมต้องใช้แม่พิมพ์ราคาแพงและสั่งขั้นต่ำเป็นพัน ๆ ชิ้น แต่เครื่องพิมพ์ 3D ผลิตชิ้นเดียวก็คุ้มค่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "นอกจากนี้มันยังเป็นเครื่องมือสร้างต้นแบบที่ทรงพลัง นักออกแบบและวิศวกรใช้พิมพ์ตัวอย่างเพื่อทดลองและปรับแก้ก่อนผลิตจริง ลดทั้งเวลาและต้นทุนได้มหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องพิมพ์ 3D ทำอะไรไม่ได้บ้าง", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เพื่อตั้งความคาดหวังให้ถูกต้อง เครื่องพิมพ์ 3D สำหรับใช้ที่บ้านก็มีข้อจำกัด มันไม่ใช่เครื่องเสกของได้ทุกอย่าง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ชิ้นงานส่วนใหญ่ทำจากพลาสติก จึงไม่แข็งแรงเท่าโลหะหรือชิ้นงานที่ผลิตจากโรงงาน การพิมพ์หนึ่งชิ้นใช้เวลาเป็นชั่วโมงหรือหลายชั่วโมง จึงไม่เหมาะกับการผลิตจำนวนมาก และผิวงานที่ได้มักมีเส้นชั้นให้เห็น ไม่เรียบเนียนเหมือนของฉีดขึ้นรูปจากโรงงาน เว้นแต่จะนำไปขัดแต่งเพิ่ม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แต่สำหรับมือใหม่ ข้อจำกัดเหล่านี้ไม่ใช่ปัญหาเลย เพราะเสน่ห์ของมันอยู่ที่การได้ลงมือสร้างของด้วยตัวเองมากกว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุปตอนที่ 1", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องพิมพ์ 3D คือเครื่องที่สร้างวัตถุสามมิติด้วยการเติมวัสดุทีละชั้นจากล่างขึ้นบน ตามแบบจากไฟล์ดิจิทัล กระบวนการหลักมีสามขั้น คือ ได้โมเดล นำไปสไลซ์ และพิมพ์ออกมา มันทรงพลังในแง่ที่ให้คนธรรมดาผลิตของเองได้ แม้จะมีข้อจำกัดด้านความแข็งแรงและความเร็วอยู่บ้าง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ในตอนต่อไป เราจะเจาะลึกว่าเครื่องพิมพ์ 3D มีกี่ประเภท และแต่ละแบบเหมาะกับใคร เพื่อช่วยให้คุณเลือกได้ถูกตั้งแต่ก่อนเริ่มต้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตอนที่ 2: ประเภทของเครื่องพิมพ์ 3D — FDM กับ Resin ต่างกันอย่างไร (เร็ว ๆ นี้)", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}], "direction": null}}	2026-06-16 04:57:39.591+00	2026-06-04 06:11:52.488+00	published	2026-06-16 04:57:39.773+00	2026-06-16 04:57:39.773+00	t	2026-06-04 06:11:52.488+00
2	2	อุปกรณ์ Active vs Passive ต่างกันอย่างไร?	active-vs-passive-electronic-components	\N	ทำความเข้าใจความแตกต่างระหว่างอุปกรณ์อิเล็กทรอนิกส์ Active และ Passive ทั้งคุณสมบัติ หน้าที่ และตัวอย่างอุปกรณ์ พร้อมตารางเปรียบเทียบที่เข้าใจง่าย	14	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ทำความเข้าใจความแตกต่างระหว่างอุปกรณ์อิเล็กทรอนิกส์ Active และ Passive", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ในโลกของอิเล็กทรอนิกส์ที่ซับซ้อน อุปกรณ์ต่างๆ มีบทบาทสำคัญในการทำงานของวงจรไฟฟ้า อุปกรณ์เหล่านี้สามารถแบ่งออกเป็นสองประเภทหลักๆ ได้แก่ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "**อุปกรณ์ Active (Active Components)**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " และ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "**อุปกรณ์ Passive (Passive Components)**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " การทำความเข้าใจความแตกต่างระหว่างอุปกรณ์ทั้งสองประเภทนี้เป็นสิ่งสำคัญสำหรับทุกคนที่สนใจในสาขาวิทยาการอิเล็กทรอนิกส์ ไม่ว่าจะเป็นนักเรียน นักพัฒนา หรือผู้ที่ชื่นชอบงานอดิเรก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Active (Active Components) คืออะไร?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Active คือชิ้นส่วนอิเล็กทรอนิกส์ที่ต้องการแหล่งพลังงานภายนอกเพื่อทำงาน และมีความสามารถในการควบคุมการไหลของกระแสไฟฟ้า หรือขยายสัญญาณไฟฟ้าได้ อุปกรณ์เหล่านี้มักจะทำหน้าที่เป็น \\"สมอง\\" หรือ \\"หัวใจ\\" ของวงจร ทำให้วงจรสามารถประมวลผลสัญญาณ สร้างสัญญาณ หรือขยายกำลังได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสมบัติหลักของอุปกรณ์ Active:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ต้องการพลังงานภายนอก:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " อุปกรณ์ Active ไม่สามารถทำงานได้ด้วยตัวเอง ต้องอาศัยแหล่งจ่ายไฟภายนอก เช่น แบตเตอรี่ หรือแหล่งจ่ายไฟกระแสตรง (DC power supply)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สามารถขยายสัญญาณได้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หนึ่งในคุณสมบัติที่สำคัญที่สุดคือความสามารถในการขยายสัญญาณไฟฟ้า ทำให้สัญญาณอ่อนๆ มีความแรงเพิ่มขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ควบคุมการไหลของกระแสไฟฟ้า:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " อุปกรณ์เหล่านี้สามารถควบคุมทิศทางและปริมาณของกระแสไฟฟ้าที่ไหลผ่านวงจรได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สร้างสัญญาณหรือสลับสถานะ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " สามารถสร้างสัญญาณไฟฟ้า หรือทำหน้าที่เป็นสวิตช์อิเล็กทรอนิกส์เพื่อเปิดหรือปิดวงจรได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวอย่างของอุปกรณ์ Active:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทรานซิสเตอร์ (Transistors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เป็นอุปกรณ์หลักที่ใช้ในการขยายสัญญาณและสลับสถานะในวงจรดิจิทัลและอนาล็อก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไดโอด (Diodes):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ยอมให้กระแสไฟฟ้าไหลผ่านได้ในทิศทางเดียว และใช้ในการแปลงกระแสสลับเป็นกระแสตรง (Rectification)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "วงจรรวม (Integrated Circuits - ICs):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หรือที่เรียกว่าชิป เป็นการรวมอุปกรณ์ Active และ Passive จำนวนมากเข้าไว้ด้วยกันบนแผ่นซิลิคอนขนาดเล็ก เพื่อทำหน้าที่ที่ซับซ้อน เช่น ไมโครโปรเซสเซอร์ หรือหน่วยความจำ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Passive (Passive Components) คืออะไร?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Passive คือชิ้นส่วนอิเล็กทรอนิกส์ที่ไม่ต้องการแหล่งพลังงานภายนอกเพื่อทำงาน และไม่สามารถขยายสัญญาณไฟฟ้าได้ หน้าที่หลักของอุปกรณ์เหล่านี้คือการจัดเก็บ การกระจาย หรือการกรองพลังงานไฟฟ้าในวงจร พวกมันจะตอบสนองต่อสัญญาณไฟฟ้าที่เข้ามา แต่ไม่สามารถเพิ่มพลังงานให้กับสัญญาณนั้นได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสมบัติหลักของอุปกรณ์ Passive:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่ต้องใช้พลังงานภายนอก: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "อุปกรณ์ Passive สามารถทำงานได้โดยไม่ต้องมีแหล่งจ่ายไฟแยกต่างหาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขยายสัญญาณไม่ได้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ไม่มีความสามารถในการขยายสัญญาณไฟฟ้าที่ไหลผ่าน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จัดเก็บหรือกระจายพลังงาน:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ทำหน้าที่ในการจัดเก็บพลังงาน (เช่น ในตัวเก็บประจุ) หรือกระจายพลังงานในรูปของความร้อน (เช่น ในตัวต้านทาน)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่สามารถควบคุมกระแสไฟฟ้าได้โดยตรง:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " พวกมันจะต้านทานหรือจัดเก็บพลังงานตามคุณสมบัติทางกายภาพของมัน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวอย่างของอุปกรณ์ Passive:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวต้านทาน (Resistors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ใช้ในการจำกัดการไหลของกระแสไฟฟ้าและลดแรงดันไฟฟ้าในวงจร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเก็บประจุ (Capacitors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ใช้ในการจัดเก็บพลังงานไฟฟ้าในรูปของสนามไฟฟ้า และสามารถบล็อกกระแสตรงในขณะที่ยอมให้กระแสสลับผ่านได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเหนี่ยวนำ (Inductors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ใช้ในการจัดเก็บพลังงานไฟฟ้าในรูปของสนามแม่เหล็ก และสามารถต้านทานการเปลี่ยนแปลงของกระแสไฟฟ้าได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ตารางเปรียบเทียบ: Active vs Passive Components", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสมบัติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Active Components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Passive Components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การใช้พลังงานภายนอก", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ต้องใช้พลังงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่ต้องใช้พลังงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การขยายสัญญาณ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สามารถขยายได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขยายไม่ได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หน้าที่หลัก", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ควบคุมการไหลของกระแสไฟฟ้า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เก็บ/ระบายพลังงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวอย่าง", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทรานซิสเตอร์, ไดโอด, IC ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวต้านทาน, ตัวเก็บประจุ, ตัวเหนี่ยวนำ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [219, 248, 309], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุป", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การแยกแยะระหว่างอุปกรณ์ Active และ Passive เป็นพื้นฐานสำคัญในการออกแบบและวิเคราะห์วงจรอิเล็กทรอนิกส์ อุปกรณ์ Active ทำหน้าที่เป็นส่วนควบคุมและขยายสัญญาณ ทำให้วงจรมีชีวิตชีวาและสามารถทำงานที่ซับซ้อนได้ ในขณะที่อุปกรณ์ Passive ทำหน้าที่เป็นส่วนสนับสนุนในการจัดเก็บ จัดการ และกรองพลังงาน ทำให้วงจรมีความเสถียรและทำงานได้อย่างถูกต้อง การทำงานร่วมกันของอุปกรณ์ทั้งสองประเภทนี้ทำให้เกิดอุปกรณ์อิเล็กทรอนิกส์ที่หลากหลายและซับซ้อนที่เราใช้ในชีวิตประจำวัน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หวังว่าบทความนี้จะช่วยให้คุณเข้าใจความแตกต่างที่สำคัญระหว่างอุปกรณ์อิเล็กทรอนิกส์ Active และ Passive ได้ชัดเจนยิ่งขึ้น หากมีข้อสงสัยเพิ่มเติม สามารถสอบถามได้เลย!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 04:57:40.282+00	2026-06-04 05:47:10.567+00	published	2026-06-16 04:57:40.428+00	2026-06-16 04:57:40.428+00	t	2026-06-04 05:47:10.567+00
3	1	10 เครื่องมือที่คนทำ Embedded ต้องมีติดตัว (ฉบับมือใหม่ห้ามพลาด!)	10-tools-for-beginner-embedded-systems		รวม 10 เครื่องมือที่จำเป็นสำหรับการทำ Embedded Systems ทั้งซอฟต์แวร์และฮาร์ดแวร์ จัดหมวดหมู่ให้ครบ เหมาะสำหรับมือใหม่ที่อยากเริ่มต้นอย่างถูกต้อง	16	10 เครื่องมือที่คนทำ Embedded ต้องมีติดตัว	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ถ้าอยากเริ่มต้นทำโปรเจกต์ Embedded Systems จริงจัง เครื่องมือที่ถูกต้องจะช่วยให้ประหยัดเวลา debug ได้เป็นชั่วโมง และลดโอกาสทำวงจรพังโดยไม่รู้สาเหตุ บทความนี้รวม 10 เครื่องมือที่จำเป็นที่สุด จัดหมวดหมู่ให้เรียบร้อย ซื้อตามลำดับความสำคัญได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หมวดที่ 1 — ซอฟต์แวร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เริ่มจากสิ่งที่ไม่ต้องเสียเงินก่อน ซอฟต์แวร์ส่วนใหญ่มีเวอร์ชันฟรีให้ใช้ได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1. IDE — โปรแกรมเขียนโค้ด", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IDE ย่อมาจาก ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Integrated Development Environment", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หรือพูดง่าย ๆ ก็คือ \\"โปรแกรมที่รวมทุกอย่างสำหรับเขียนโค้ดไว้ในที่เดียว\\" ไม่ว่าจะเป็นการพิมพ์โค้ด, ตรวจ error, หรือ compile โปรแกรม ทำได้หมดในหน้าต่างเดียว ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IDE ที่ดีจะขีดเส้นใต้ตรงที่โค้ดผิด เตือนก่อนที่จะ compile บอกให้รู้ว่าลืมปิดวงเล็บ หรือพิมพ์ชื่อตัวแปรผิด สิ่งเหล่านี้ฟังดูเล็กน้อย แต่ช่วยประหยัดเวลาได้มากมายในระยะยาว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IDE", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เหมาะกับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino IDE", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino, ESP32 (มือใหม่มาก)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "PlatformIO", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino, ESP32, STM32 (ยืดหยุ่นกว่า)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32CubeIDE", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32 โดยเฉพาะ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Keil MDK", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ARM-based chips (มืออาชีพ)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มีแบบฟรีจำกัด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [235, 239, 246], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เริ่มจาก ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "**Arduino IDE**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ก่อนเลย ติดตั้งง่าย ใช้งานง่าย และมีตัวอย่างโค้ดให้เพียบ พอชำนาญแล้วค่อยย้ายไป PlatformIO หรือ STM32CubeIDE", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2. PCB Design Software — โปรแกรมออกแบบแผงวงจร", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อไหร่ก็ตามที่โปรเจกต์ซับซ้อนขึ้น การต่อสายบน breadboard จะเริ่มยุ่งเหยิง ขั้นตอนต่อไปคือการออกแบบ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "PCB (Printed Circuit Board) ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "หรือแผงวงจรพิมพ์ ซึ่งต้องใช้โปรแกรมเฉพาะ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "โปรแกรมออกแบบ PCB ที่ดีช่วยให้วางตำแหน่งชิ้นส่วนได้ถูกต้อง, จัดการสายไฟได้เป็นระเบียบ, และส่งออกไฟล์ไปผลิต PCB จริงได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "โปรแกรม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จุดเด่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "KiCAD", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี 100%, ฟีเจอร์ครบ, ชุมชนใหญ่ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Eagle", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฐานผู้ใช้เยอะ, tutorial เพียบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรีแบบจำกัด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Altium Designer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มาตรฐานอุตสาหกรรม ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แพง (สำหรับมืออาชีพ)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [234, 217, 251], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "KiCAD ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "เป็นตัวเลือกที่ดีที่สุดสำหรับผู้เริ่มต้น ฟรีทั้งหมด ไม่มีล็อคฟีเจอร์ และมีชุมชนคอยช่วยเหลือมากมาย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3. Debugger/Programmer — ดีบักเกอร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ดีบักเกอร์คืออุปกรณ์ (และซอฟต์แวร์) ที่ช่วยให้คุณ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "รันโค้ดทีละบรรทัด", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " และดูว่าตัวแปรแต่ละตัวมีค่าอะไรในระหว่างการทำงาน แทนที่จะต้องเดาว่า bug อยู่ตรงไหน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพว่าโค้ดรันแล้วทำงานผิดพลาด ถ้าไม่มีดีบักเกอร์ก็ต้องเพิ่มบรรทัด `Serial.print()` ไปเรื่อย ๆ เพื่อดูว่าโค้ดไปถึงไหน แต่ถ้ามีดีบักเกอร์ กดหยุดได้เลย ดูค่าตัวแปรทุกตัวได้ทันที ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกตามชิปที่ใช้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ชิป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ดีบักเกอร์แนะนำ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ST-Link V2", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ARM ทั่วไป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "J-Link", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "PIC/dsPIC", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "PICKit2 หรือ PICKit3", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino/ESP32", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มี built-in ผ่าน USB ได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [218, 364], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "⚠️ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "หมายเหตุ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ยังไม่มีดีบักเกอร์ตัวเดียวที่ใช้ได้กับทุกชิป เลือกให้ตรงกับบอร์ดที่ใช้งานก่อนซื้อ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หมวดที่ 2 — เครื่องมือวัดสัญญาณ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องมือในหมวดนี้ช่วยให้คุณ \\"มองเห็น\\" สิ่งที่เกิดขึ้นในวงจรจริง ๆ ซึ่งแค่ดูโค้ดอย่างเดียวไม่มีทางรู้ได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "4. Multimeter — มัลติมิเตอร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " มัลติมิเตอร์คือเพื่อนแท้ของนักอิเล็กทรอนิกส์ทุกคน ใช้วัดได้ทั้งแรงดันไฟฟ้า (Voltage), กระแสไฟฟ้า (Current), และความต้านทาน (Resistance) ในตัวเดียว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกครั้งที่วงจรทำงานผิดพลาด คำถามแรกที่ต้องถามคือ \\"ไฟถึงจุดนี้มั้ย?\\" และมัลติมิเตอร์คือตัวตอบคำถามนั้น ใช้ตรวจสอบว่าสายต่อถูกหรือเปล่า, วงจรลัดหรือเปล่า, หรือชิ้นส่วนตัวไหนเสีย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ระดับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคาโดยประมาณ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "CD800A / DT830", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่ / งบจำกัด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "200–400 บาท", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Uni-T UT61E", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลาง / คุ้มค่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1,500–2,000 บาท", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Fluke 117", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มืออาชีพ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5,000+ บาท ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [216, 234, 221], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เริ่มจากตัวราคา 200–400 บาทก็ใช้ได้ดีในช่วงเรียนรู้ พอมั่นใจแล้วว่าจะใช้จริงจังค่อยอัปเกรดเป็น Fluke", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5. Oscilloscope — ออสซิลโลสโคป", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ออสซิลโลสโคปคือเครื่องมือที่ทำให้คุณ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\"มองเห็น\\" ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "สัญญาณไฟฟ้าในแบบ real-time แกน X คือเวลา แกน Y คือแรงดัน แค่นี้เองแต่มันเปิดโลกมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มัลติมิเตอร์บอกได้แค่ว่า \\"ตอนนี้มีไฟกี่โวลต์\\" แต่ออสซิลโลสโคปบอกได้ว่าสัญญาณมีรูปร่างเป็นยังไง มีสัญญาณรบกวนมั้ย ความถี่เท่าไหร่ สิ่งเหล่านี้สำคัญมากเมื่อทำงานกับ PWM, สัญญาณเสียง, หรือการสื่อสารดิจิทัล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จุดเด่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "FNIRSI DSO152", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "พกพาได้, ราคาถูก, เหมาะมือใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "HANMATEK DOS1102", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ความถี่ 110 MHz, ประสิทธิภาพดี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Owon SDS200", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ระดับกลาง, ครบฟีเจอร์", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [295, 358], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "6. Logic Analyzer — ลอจิกอนาไลเซอร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ออสซิลโลสโคปดูสัญญาณแบบ analog ได้ดี แต่ถ้าอยากถอดรหัสการสื่อสารดิจิทัลอย่าง ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "SPI, I2C, UART, CAN ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "ต้องใช้ Logic Analyzer แทน มันจะแปลงสัญญาณดิบให้กลายเป็นข้อมูลที่อ่านออก เช่น \\"ไมโครคอนโทรลเลอร์ส่ง 0x3F ไปให้เซนเซอร์\\"", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ถ้าเคยทดลองต่อ Sensor ผ่าน I2C แล้วไม่มีข้อมูลขึ้นมาเลย โดยไม่รู้ว่าปัญหาอยู่ที่โค้ดหรือสายไฟ Logic Analyzer จะบอกได้ทันทีว่าสัญญาณถูกส่งออกไปหรือเปล่า และค่าที่ส่งไปถูกต้องมั้ย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ระดับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "งบน้อย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "USB Logic Analyzer 8-channel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ต่ำกว่า $25", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลาง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Saleae Compatible", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$30–60", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มืออาชีพ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Saleae Logic Pro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$500+", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [186, 183, 246], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "USB Logic Analyzer ราคาต่ำกว่า $25 ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "เพียงพอมากสำหรับการ debug งาน SPI/I2C/UART ทั่วไปในช่วงเรียนรู้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หมวดที่ 3 — ฮาร์ดแวร์และอุปกรณ์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ฮาร์ดแวร์ที่ต้องมีประจำโต๊ะทำงาน ตั้งแต่แหล่งจ่ายไฟไปจนถึงบอร์ดทดลอง ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "7. Power Supply — แหล่งจ่ายไฟ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แหล่งจ่ายไฟแบบ bench (ตั้งโต๊ะ) ที่ปรับแรงดันและกระแสได้เองนั้น สำคัญกว่าที่คิดมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ถ้าใช้แบตเตอรี่หรือ adapter ทั่วไปเป็นแหล่งจ่ายไฟ จะไม่รู้เลยว่าตอนนี้วงจรกินกระแสเท่าไหร่ แต่ถ้ามี bench PSU จะเห็นตัวเลขกระแสและแรงดันแบบ real-time และที่สำคัญคือ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ตั้งค่า Current Limit ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "ได้ ป้องกันวงจรไหม้เมื่อต่อผิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DC Regulated Bench Power Supply ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (หาได้ทั่วไปใน Shopee/Lazada)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "BSIDE DC Laboratory PSU", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — ดีไซน์สะอาด จออ่านง่าย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เคล็ดลับ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เลือก PSU ที่แสดงทั้งแรงดันและกระแสพร้อมกัน และมีปุ่มตั้ง Current Limit ได้ ฟีเจอร์นี้สำคัญมากสำหรับมือใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "8. Soldering Station — สถานีบัดกรี", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "บัดกรีเป็นทักษะพื้นฐานของทุกคนที่ทำ hardware และ สถานีบัดกรีที่ดีทำให้งานออกมาสะอาดและน่าเชื่อถือกว่าการใช้เหล็กแร่ธรรมดามาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เหล็กแร่ราคาถูกมักควบคุมอุณหภูมิไม่ได้ ทำให้ร้อนเกินไปและเผา pad บน PCB หรือร้อนไม่พอทำให้ตะกั่วไม่ละลาย สถานีบัดกรีที่ดีควบคุมอุณหภูมิได้แม่นยำ ช่วยให้งานออกมาดีขึ้นทันที", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จุดเด่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "AIFEN A9E", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ควบคุมอุณหภูมิดีเยี่ยม, ร้อนเร็ว, แนะนำมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "YIHUA 926 III", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคาเป็นมิตร, ใช้งานได้ดีสำหรับงานทั่วไป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [216, 247], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เริ่มจากเหล็กแร่ธรรมดาได้ถ้างบจำกัด แต่ถ้าจะลงทุนสักตัว สถานีบัดกรีคืนทุนไวมากเพราะใช้บ่อยที่สุดในบรรดาเครื่องมือทั้งหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "9. Passive Components — ชิ้นส่วนอิเล็กทรอนิกส์พื้นฐาน", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "\\"Passive Components\\" หรือชิ้นส่วนที่ไม่ต้องการไฟเลี้ยงเอง ได้แก่ ตัวต้านทาน (Resistor), ตัวเก็บประจุ (Capacitor), และตัวเหนี่ยวนำ (Inductor) สิ่งเหล่านี้มีอยู่ในเกือบทุกวงจร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตอนออกแบบวงจรจริงมักจะต้องการค่าที่จำเพาะมาก และถ้าไม่มีสต็อกไว้ก็ต้องรอสั่งซื้อ ทำให้โปรเจกต์สะดุดได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แนะนำให้สต็อกไว้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวต้านทาน (Resistors)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ค่ามาตรฐานอนุกรม E24 ครบชุด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Package: through-hole สำหรับมือใหม่, SMD 0805 เมื่อชำนาญขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กำลัง: 0.25W และ 0.5W", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเก็บประจุ (Capacitors)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่มีขั้ว (Ceramic): 10nF, 100nF, 1μF — สำหรับ bypass/decoupling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มีขั้ว (Electrolytic): 10μF, 100μF, 470μF, 1000μF — สำหรับกรองไฟ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเหนี่ยวนำ (Inductors)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10μH, 100μH, 330μH — ค่าทั่วไปที่ใช้บ่อย ไม่ต้องสต็อกมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เคล็ดลับประหยัดเงิน:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ไม่ต้องซื้อทุกค่าพร้อมกัน ซื้อเพิ่มทีละนิดเมื่อเริ่มโปรเจกต์ใหม่ สักพักก็จะมีสต็อกครบเอง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10. Development Board — บอร์ดพัฒนา", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "บอร์ดพัฒนาคือ \\"สนามเด็กเล่น\\" ของวิศวกร Embedded มีชิปไมโครคอนโทรลเลอร์พร้อม USB, หน้าจอ, และอุปกรณ์ต่าง ๆ มาให้ครบในบอร์ดเดียว เปิดขึ้นมาก็เขียนโค้ดได้เลยโดยไม่ต้องบัดกรีอะไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การทดลองบนบอร์ดพัฒนาก่อนทำ PCB จริงช่วยประหยัดทั้งเงินและเวลาได้มหาศาล ถ้าโค้ดหรือวงจรมีปัญหาก็แก้ได้ง่าย ๆ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ตัวเลือกแนะนำตามระดับ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับมือใหม่:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino Uno / Nano", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — เริ่มต้นที่ดีที่สุด ชุมชนใหญ่ บทเรียนเพียบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ESP32 / NodeMCU", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — มี Wi-Fi และ Bluetooth ในตัว เหมาะกับงาน IoT", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับผู้ที่ต้องการมากกว่านั้น:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32 Nucleo / Blue Pill", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — ชิปอุตสาหกรรม, ฟีเจอร์ครบ, ราคาไม่แพง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Raspberry Pi", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — รัน Linux ได้เลย เหมาะกับงาน Edge Computing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับงาน AI / ML:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "NVIDIA Jetson Nano ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "— ประมวลผล AI บน Edge ได้จริง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Arduino Uno ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "ราคาหลักร้อยบาท มีบทเรียนฟรีบนอินเทอร์เน็ตนับพัน เริ่มตรงนี้ก่อนเลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่มีใครที่ซื้อครบทุกอย่างในวันแรก ค่อย ๆ สะสมตามโปรเจกต์ที่ทำ สักวันหนึ่งมองย้อนกลับมาจะพบว่าโต๊ะทำงานเต็มไปด้วยเครื่องมือโดยไม่รู้ตัวเลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 04:57:40.929+00	2026-06-03 20:23:17.192+00	published	2026-06-16 04:57:41.113+00	2026-06-16 04:57:41.113+00	t	2026-06-03 20:23:17.192+00
6	4	จากไฟฟ้าเปิด-ปิด สู่โค้ดภาษา C: คอมพิวเตอร์เข้าใจเราได้อย่างไร?	electricity-to-c-code	\N	คอมพิวเตอร์รู้จักแค่ไฟฟ้าเปิดกับปิด แล้วมันเข้าใจโค้ดที่เราพิมพ์ได้อย่างไร? บทความนี้พาไขความลับทีละชั้น จาก Machine Code สู่ภาษา C แบบที่คนไม่มีพื้นฐานก็เข้าใจได้	17	\N	Photo by <a href="https://unsplash.com/@thefreak1337?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Valentin Petkov</a> on <a href="https://unsplash.com/photos/green-and-black-circuit-board-mYY0c9WKKk8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a> 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพตามนะครับ คุณพิมพ์โค้ดสั้นๆ ลงไปในคอมพิวเตอร์ กดปุ่มรัน แล้วไฟ LED ดวงเล็กๆ บนบอร์ดก็ติดขึ้นมา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูเป็นเรื่องธรรมดา แต่ถ้าเราหยุดคิดสักนิด มันน่าทึ่งไม่น้อย เพราะสิ่งที่อยู่ตรงหน้าคุณคือก้อนซิลิคอนกับกระแสไฟฟ้า มันไม่รู้จักภาษาไทย ไม่รู้จักภาษาอังกฤษ ไม่รู้ด้วยซ้ำว่า \\"ตัวอักษร\\" คืออะไร แล้วมัน \\"เข้าใจ\\" คำสั่งที่เราพิมพ์ลงไปได้อย่างไร?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบสั้นๆ คือ คอมพิวเตอร์ไม่ได้เข้าใจภาษาของเราเลยแม้แต่น้อย สิ่งเดียวที่มันเข้าใจคือไฟฟ้า \\"เปิด\\" กับ \\"ปิด\\" เท่านั้น บทความนี้จะพาคุณไขความลับทีละขั้น ว่าจากแค่สองสถานะง่ายๆ นี้ มันค่อยๆ กลายมาเป็นโค้ดที่เราเขียนกันได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกอย่างเริ่มจากไฟฟ้าสถานะเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลึกลงไปในชิปทุกตัว ไม่ว่าจะเป็นคอมพิวเตอร์ มือถือ หรือเครื่องซักผ้า แก่นแท้ของมันคือสวิตช์ไฟฟ้าจิ๋วจำนวนมหาศาล นับเป็นพันล้านตัว สวิตช์แต่ละตัวก็เหมือนสวิตช์ไฟในบ้านเรา คือมีแค่สองสถานะ — เปิด กับ ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราแทน \\"เปิด\\" ด้วยเลข 1 และ \\"ปิด\\" ด้วยเลข 0 และเจ้าเลขสองตัวนี้เอง — 0 กับ 1 — คือภาษาเดียวที่คอมพิวเตอร์เข้าใจจริงๆ เราเรียกมันว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เลขฐานสอง (binary)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณอาจสงสัยว่า แค่ 0 กับ 1 จะสื่อความหมายอะไรได้ ลองนึกถึงการส่งสัญญาณด้วยไฟฉายตอนกลางคืนดูครับ ไฟดวงเดียวเปิด-ปิดได้แค่สองแบบ แต่ถ้าเรามีไฟหลายดวงเรียงกัน แล้วกำหนดว่าแต่ละรูปแบบการเปิด-ปิดหมายถึงอะไร เราก็ส่งข้อความที่ซับซ้อนได้ คอมพิวเตอร์ก็ใช้หลักการเดียวกันเป๊ะ เพียงแต่ทำได้เร็วและมีจำนวน \\"หลอดไฟ\\" มากกว่ามหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Machine Code: ภาษาที่คอมพิวเตอร์เข้าใจ แต่มนุษย์ปวดหัว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อเราเอาเลข 0 กับ 1 มาเรียงต่อกันเป็นชุดตามกติกาที่กำหนดไว้ มันก็กลายเป็น \\"คำสั่ง\\" ที่สั่งให้ CPU ทำงานได้ ลองดูชุดเลขนี้ครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10110000 01100001", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับเราอาจดูเหมือนเลขมั่วๆ แต่สำหรับ CPU แล้ว นี่คือคำสั่งที่ชัดเจนหนึ่งคำสั่ง ประมาณว่า \\"เอาค่านี้ไปเก็บไว้ตรงนี้\\" เราเรียกเลขฐานสองที่เป็นคำสั่งแบบนี้ว่า **Machine Code** หรือภาษาเครื่อง มันคือสิ่งที่ CPU อ่านแล้วลงมือทำได้ทันที ไม่ต้องแปลอะไรอีก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ปัญหาคือ... ลองจินตนาการว่าคุณต้องเขียนโปรแกรมทั้งโปรแกรมด้วยเลข 0 กับ 1 แบบนี้ โปรแกรมจริงๆ มีคำสั่งเป็นแสนเป็นล้านบรรทัด ไม่มีมนุษย์คนไหนเขียนหรือจำไหว แค่พิมพ์ผิดไปตัวเดียวก็หาไม่เจอแล้ว นี่จึงเป็นจุดเริ่มต้นที่มนุษย์คิดค้น \\"ตัวช่วย\\" ขึ้นมาทีละชั้น เพื่อให้เขียนโปรแกรมได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA: เมนูคำสั่งประจำตัวของ CPU แต่ละรุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ก่อนจะไปดูตัวช่วย มีอีกเรื่องที่ต้องเข้าใจก่อน นั่นคือ CPU แต่ละแบบไม่ได้เข้าใจเลขฐานสองเหมือนกันหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เปรียบเหมือนร้านอาหารที่มีเมนูของตัวเอง ร้านหนึ่งสั่ง \\"เมนูเบอร์ 5\\" ได้ผัดกะเพรา อีกร้านสั่งเบอร์ 5 เดียวกันอาจได้ข้าวมันไก่ CPU ก็เช่นกัน เลขฐานสองชุดเดียวกันอาจหมายถึงคนละคำสั่งบน CPU คนละแบบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รายการคำสั่งทั้งหมดที่ CPU รุ่นหนึ่งๆ รองรับ — ว่าเลขชุดไหนหมายถึงคำสั่งอะไร มีที่เก็บข้อมูลชั่วคราว (register) อะไรบ้าง — เราเรียกรวมๆ ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ISA (Instruction Set Architecture) ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "หรือก็คือ \\"เมนู\\" ประจำตัวของ CPU นั่นเอง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA ที่เราเจอในชีวิตจริงก็มีหลายแบบ เช่น ARM ที่อยู่ในมือถือและบอร์ด STM32, x86 ที่อยู่ในคอมพิวเตอร์และโน้ตบุ๊ก หรือ AVR ที่อยู่ในบอร์ด Arduino ยอดนิยม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ประเด็นสำคัญที่ต้องจำคือ เพราะ CPU คนละ ISA มีเมนูคนละชุด โปรแกรม (machine code) ที่สร้างมาสำหรับชิปแบบหนึ่ง จึงเอาไปรันบนชิปอีกแบบไม่ได้ จำประเด็นนี้ไว้นะครับ เดี๋ยวมันจะกลับมาสำคัญมากตอนท้าย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Assembly: แปลงเลขให้เป็นคำที่พอจำได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "วช่วยชั้นแรกที่มนุษย์คิดขึ้นมา คือการเอา \\"คำย่อ\\" มาแทนเลขฐานสองแต่ละคำสั่ง เพื่อให้พออ่านรู้เรื่องและจำได้ เราเรียกภาษาชั้นนี้ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\"Assembly\\"", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ยกตัวอย่าง machine code ชุดเดิมที่เราเห็นไปก่อนหน้า เขียนเป็น Assembly ได้แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```asm", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "MOV AL, 61h    ; เอาค่า 0x61 ไปเก็บใน register ชื่อ AL", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MOV", "type": "text", "style": "", "detail": 0, "format": 16, "version": 1}, {"mode": "normal", "text": " มาจากคำว่า move เห็นแบบนี้พออ่านออกแล้วว่ามันกำลัง \\"ย้าย\\" ค่าไปไหนสักที่ ดีกว่ามานั่งไล่อ่าน 10110000 01100001 เยอะเลย และที่สำคัญคือ Assembly หนึ่งบรรทัดนี้ แปลตรงกลับไปเป็น machine code ชุดที่เราเห็นตอนแรกได้พอดี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 16}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูดีขึ้นเยอะ แต่ Assembly ก็ยังมีจุดที่ไม่สะดวกอยู่สองข้อ ข้อแรกคือมันยังต้องสั่งงานทีละขั้นเล็กๆ อย่างละเอียด งานง่ายๆ ในหัวเราอาจต้องเขียน Assembly หลายบรรทัด ข้อสองคือ — จำเรื่อง ISA ที่บอกให้จำไว้ได้ไหมครับ — Assembly ก็ยังผูกติดกับ ISA ของชิปแต่ละแบบอยู่ดี Assembly ของ ARM กับของ x86 ก็เขียนคนละแบบ ถ้าเปลี่ยนชิปก็ต้องเขียนใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C: จุดที่ลงตัวที่สุด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วเราก็มาถึงพระเอกของเรา — ภาษา C ซึ่งเป็นตัวช่วยอีกชั้นที่ยกระดับขึ้นไปอีก ใกล้เคียงภาษามนุษย์มากขึ้น คำสั่ง Assembly ที่เราเห็นเมื่อกี้ เขียนเป็นภาษา C ได้สั้นๆ แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```c", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "char al = 0x61", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อ่านปุ๊บก็พอเดาออกว่า \\"เก็บค่า 0x61 ลงในตัวแปรชื่อ al\\" เราไม่ต้องไปยุ่งกับ register หรือจำเมนูของ ISA ให้ปวดหัวอีกต่อไป เราเขียนสิ่งที่เราอยากให้เกิดขึ้น แล้วมีโปรแกรมตัวหนึ่งที่เรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "คอมไพเลอร์ (compiler)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ทำหน้าที่แปลโค้ด C ของเราลงไปเป็น Assembly และ machine code ให้เองโดยอัตโนมัติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แต่จุดที่ทำให้ C เจ๋งจริงๆ คือเรื่องนี้ครับ — โค้ด C ชุดเดียวกันนี้ เราเอาไปคอมไพล์สำหรับชิป ARM ก็ได้ x86 ก็ได้ AVR ก็ได้ แค่เปลี่ยนคอมไพเลอร์ให้ตรงกับชิป โดยไม่ต้องเขียนโค้ดใหม่ ต่างจาก Assembly ที่ต้องเขียนใหม่ทุกครั้งที่เปลี่ยนชิป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "นี่แหละคือเหตุผลที่ C ลงตัวที่สุดสำหรับงานที่ต้องคุมฮาร์ดแวร์ มันใกล้ชิดฮาร์ดแวร์พอที่จะสั่งงานได้ละเอียด แต่ก็ยังเขียนเป็นภาษาที่คนเข้าใจได้ และย้ายข้ามชิปได้ มันเลยกลายเป็นภาษาหลักของงานระบบฝังตัว (Embedded System) มาจนถึงทุกวันนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาพรวมทั้งหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองมาดูเส้นทางทั้งหมดในภาพเดียวกันครับ ว่าโค้ดที่เราเขียนเดินทางลงไปจนถึงไฟฟ้าจริงได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สิ่งที่อยากให้จดจำจากภาพนี้คือ ยิ่งอยู่ชั้นบน มนุษย์ยิ่งเขียนง่าย แต่ก็ยิ่งห่างจากฮาร์ดแวร์ ส่วนยิ่งอยู่ชั้นล่าง ยิ่งคุมฮาร์ดแวร์ได้ละเอียด แต่ก็เขียนยากขึ้นเรื่อยๆ และไม่ว่าเราจะเขียนที่ชั้นไหน สุดท้ายทุกอย่างจะถูกแปลกลับลงมาเป็นไฟฟ้าเปิด-ปิดในวงจรจริงเสมอ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C          char al = 0x61;          ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← มนุษย์เขียน อ่านง่าย ย้ายข้ามชิปได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (คอมไพเลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "  Assembly         MOV AL, 61h              ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← ผูกกับ ISA ของชิปแล้ว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (แอสเซมเบลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " Machine Code   10110000 01100001           ← CPU อ่านได้โดยตรง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "   Hardware      ⚡ ไฟฟ้าเปิด/ปิดในวงจรจริง   ← LED ติด, มอเตอร์หมุน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลับมาที่คำถามตอนต้น ว่าคอมพิวเตอร์ \\"เข้าใจ\\" คำสั่งของเราได้อย่างไร ทั้งที่มันรู้จักแค่ไฟฟ้าเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบก็คือ มันไม่ได้เข้าใจเราโดยตรงเลย แต่มีชั้นของการแปลภาษาซ้อนกันอยู่หลายชั้น ตั้งแต่ภาษา C ที่เราเขียน ถูกแปลลงเป็น Assembly แล้วเป็น Machine Code และสุดท้ายกลายเป็นไฟฟ้าที่ไหลในวงจร แต่ละชั้นทำหน้าที่แปลภาษาให้อีกชั้นที่อยู่ต่ำกว่าเข้าใจ มันไม่ใช่เวทมนตร์ แต่เป็นระบบที่มนุษย์ค่อยๆ สร้างขึ้นมาอย่างชาญฉลาด เพื่อให้เราคุยกับเครื่องจักรได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "และถ้าคุณอ่านมาถึงตรงนี้แล้วรู้สึกว่าอยากลองเขียนโค้ด C สั่งให้ฮาร์ดแวร์ทำงานด้วยตัวเองดูบ้าง — สั่งให้ LED ติด อ่านค่าจากเซ็นเซอร์ หรือควบคุมมอเตอร์ — นี่แหละคือโลกของการเขียนโปรแกรมระบบฝังตัว ที่คุณเริ่มต้นได้แม้ไม่มีพื้นฐานมาก่อน เพราะตอนนี้คุณเข้าใจภาพใหญ่ทั้งหมดแล้วว่าทุกอย่างเชื่อมโยงกันอย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วพบกันในบทความถัดไปครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 05:24:04.069+00	2026-06-16 05:13:40.891+00	published	2026-06-16 05:24:05.408+00	2026-06-16 05:24:05.408+00	f	2026-06-16 06:30:00+00
7	4	จากไฟฟ้าเปิด-ปิด สู่โค้ดภาษา C: คอมพิวเตอร์เข้าใจเราได้อย่างไร?	electricity-to-c-code	\N	คอมพิวเตอร์รู้จักแค่ไฟฟ้าเปิดกับปิด แล้วมันเข้าใจโค้ดที่เราพิมพ์ได้อย่างไร? บทความนี้พาไขความลับทีละชั้น จาก Machine Code สู่ภาษา C แบบที่คนไม่มีพื้นฐานก็เข้าใจได้	17	\N	Photo by <a href="https://unsplash.com/@thefreak1337?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Valentin Petkov</a> on <a href="https://unsplash.com/photos/green-and-black-circuit-board-mYY0c9WKKk8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a> 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพตามนะครับ คุณพิมพ์โค้ดสั้นๆ ลงไปในคอมพิวเตอร์ กดปุ่มรัน แล้วไฟ LED ดวงเล็กๆ บนบอร์ดก็ติดขึ้นมา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูเป็นเรื่องธรรมดา แต่ถ้าเราหยุดคิดสักนิด มันน่าทึ่งไม่น้อย เพราะสิ่งที่อยู่ตรงหน้าคุณคือก้อนซิลิคอนกับกระแสไฟฟ้า มันไม่รู้จักภาษาไทย ไม่รู้จักภาษาอังกฤษ ไม่รู้ด้วยซ้ำว่า \\"ตัวอักษร\\" คืออะไร แล้วมัน \\"เข้าใจ\\" คำสั่งที่เราพิมพ์ลงไปได้อย่างไร?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบสั้นๆ คือ คอมพิวเตอร์ไม่ได้เข้าใจภาษาของเราเลยแม้แต่น้อย สิ่งเดียวที่มันเข้าใจคือไฟฟ้า \\"เปิด\\" กับ \\"ปิด\\" เท่านั้น บทความนี้จะพาคุณไขความลับทีละขั้น ว่าจากแค่สองสถานะง่ายๆ นี้ มันค่อยๆ กลายมาเป็นโค้ดที่เราเขียนกันได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกอย่างเริ่มจากไฟฟ้าสถานะเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลึกลงไปในชิปทุกตัว ไม่ว่าจะเป็นคอมพิวเตอร์ มือถือ หรือเครื่องซักผ้า แก่นแท้ของมันคือสวิตช์ไฟฟ้าจิ๋วจำนวนมหาศาล นับเป็นพันล้านตัว สวิตช์แต่ละตัวก็เหมือนสวิตช์ไฟในบ้านเรา คือมีแค่สองสถานะ — เปิด กับ ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราแทน \\"เปิด\\" ด้วยเลข 1 และ \\"ปิด\\" ด้วยเลข 0 และเจ้าเลขสองตัวนี้เอง — 0 กับ 1 — คือภาษาเดียวที่คอมพิวเตอร์เข้าใจจริงๆ เราเรียกมันว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เลขฐานสอง (binary)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณอาจสงสัยว่า แค่ 0 กับ 1 จะสื่อความหมายอะไรได้ ลองนึกถึงการส่งสัญญาณด้วยไฟฉายตอนกลางคืนดูครับ ไฟดวงเดียวเปิด-ปิดได้แค่สองแบบ แต่ถ้าเรามีไฟหลายดวงเรียงกัน แล้วกำหนดว่าแต่ละรูปแบบการเปิด-ปิดหมายถึงอะไร เราก็ส่งข้อความที่ซับซ้อนได้ คอมพิวเตอร์ก็ใช้หลักการเดียวกันเป๊ะ เพียงแต่ทำได้เร็วและมีจำนวน \\"หลอดไฟ\\" มากกว่ามหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Machine Code: ภาษาที่คอมพิวเตอร์เข้าใจ แต่มนุษย์ปวดหัว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อเราเอาเลข 0 กับ 1 มาเรียงต่อกันเป็นชุดตามกติกาที่กำหนดไว้ มันก็กลายเป็น \\"คำสั่ง\\" ที่สั่งให้ CPU ทำงานได้ ลองดูชุดเลขนี้ครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10110000 01100001", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับเราอาจดูเหมือนเลขมั่วๆ แต่สำหรับ CPU แล้ว นี่คือคำสั่งที่ชัดเจนหนึ่งคำสั่ง ประมาณว่า \\"เอาค่านี้ไปเก็บไว้ตรงนี้\\" เราเรียกเลขฐานสองที่เป็นคำสั่งแบบนี้ว่า **Machine Code** หรือภาษาเครื่อง มันคือสิ่งที่ CPU อ่านแล้วลงมือทำได้ทันที ไม่ต้องแปลอะไรอีก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ปัญหาคือ... ลองจินตนาการว่าคุณต้องเขียนโปรแกรมทั้งโปรแกรมด้วยเลข 0 กับ 1 แบบนี้ โปรแกรมจริงๆ มีคำสั่งเป็นแสนเป็นล้านบรรทัด ไม่มีมนุษย์คนไหนเขียนหรือจำไหว แค่พิมพ์ผิดไปตัวเดียวก็หาไม่เจอแล้ว นี่จึงเป็นจุดเริ่มต้นที่มนุษย์คิดค้น \\"ตัวช่วย\\" ขึ้นมาทีละชั้น เพื่อให้เขียนโปรแกรมได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA: เมนูคำสั่งประจำตัวของ CPU แต่ละรุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ก่อนจะไปดูตัวช่วย มีอีกเรื่องที่ต้องเข้าใจก่อน นั่นคือ CPU แต่ละแบบไม่ได้เข้าใจเลขฐานสองเหมือนกันหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เปรียบเหมือนร้านอาหารที่มีเมนูของตัวเอง ร้านหนึ่งสั่ง \\"เมนูเบอร์ 5\\" ได้ผัดกะเพรา อีกร้านสั่งเบอร์ 5 เดียวกันอาจได้ข้าวมันไก่ CPU ก็เช่นกัน เลขฐานสองชุดเดียวกันอาจหมายถึงคนละคำสั่งบน CPU คนละแบบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รายการคำสั่งทั้งหมดที่ CPU รุ่นหนึ่งๆ รองรับ — ว่าเลขชุดไหนหมายถึงคำสั่งอะไร มีที่เก็บข้อมูลชั่วคราว (register) อะไรบ้าง — เราเรียกรวมๆ ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ISA (Instruction Set Architecture) ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "หรือก็คือ \\"เมนู\\" ประจำตัวของ CPU นั่นเอง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA ที่เราเจอในชีวิตจริงก็มีหลายแบบ เช่น ARM ที่อยู่ในมือถือและบอร์ด STM32, x86 ที่อยู่ในคอมพิวเตอร์และโน้ตบุ๊ก หรือ AVR ที่อยู่ในบอร์ด Arduino ยอดนิยม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ประเด็นสำคัญที่ต้องจำคือ เพราะ CPU คนละ ISA มีเมนูคนละชุด โปรแกรม (machine code) ที่สร้างมาสำหรับชิปแบบหนึ่ง จึงเอาไปรันบนชิปอีกแบบไม่ได้ จำประเด็นนี้ไว้นะครับ เดี๋ยวมันจะกลับมาสำคัญมากตอนท้าย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Assembly: แปลงเลขให้เป็นคำที่พอจำได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "วช่วยชั้นแรกที่มนุษย์คิดขึ้นมา คือการเอา \\"คำย่อ\\" มาแทนเลขฐานสองแต่ละคำสั่ง เพื่อให้พออ่านรู้เรื่องและจำได้ เราเรียกภาษาชั้นนี้ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\"Assembly\\"", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ยกตัวอย่าง machine code ชุดเดิมที่เราเห็นไปก่อนหน้า เขียนเป็น Assembly ได้แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```asm", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "MOV AL, 61h    ; เอาค่า 0x61 ไปเก็บใน register ชื่อ AL", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MOV", "type": "text", "style": "", "detail": 0, "format": 16, "version": 1}, {"mode": "normal", "text": " มาจากคำว่า move เห็นแบบนี้พออ่านออกแล้วว่ามันกำลัง \\"ย้าย\\" ค่าไปไหนสักที่ ดีกว่ามานั่งไล่อ่าน 10110000 01100001 เยอะเลย และที่สำคัญคือ Assembly หนึ่งบรรทัดนี้ แปลตรงกลับไปเป็น machine code ชุดที่เราเห็นตอนแรกได้พอดี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 16}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูดีขึ้นเยอะ แต่ Assembly ก็ยังมีจุดที่ไม่สะดวกอยู่สองข้อ ข้อแรกคือมันยังต้องสั่งงานทีละขั้นเล็กๆ อย่างละเอียด งานง่ายๆ ในหัวเราอาจต้องเขียน Assembly หลายบรรทัด ข้อสองคือ — จำเรื่อง ISA ที่บอกให้จำไว้ได้ไหมครับ — Assembly ก็ยังผูกติดกับ ISA ของชิปแต่ละแบบอยู่ดี Assembly ของ ARM กับของ x86 ก็เขียนคนละแบบ ถ้าเปลี่ยนชิปก็ต้องเขียนใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C: จุดที่ลงตัวที่สุด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วเราก็มาถึงพระเอกของเรา — ภาษา C ซึ่งเป็นตัวช่วยอีกชั้นที่ยกระดับขึ้นไปอีก ใกล้เคียงภาษามนุษย์มากขึ้น คำสั่ง Assembly ที่เราเห็นเมื่อกี้ เขียนเป็นภาษา C ได้สั้นๆ แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```c", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "char al = 0x61", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อ่านปุ๊บก็พอเดาออกว่า \\"เก็บค่า 0x61 ลงในตัวแปรชื่อ al\\" เราไม่ต้องไปยุ่งกับ register หรือจำเมนูของ ISA ให้ปวดหัวอีกต่อไป เราเขียนสิ่งที่เราอยากให้เกิดขึ้น แล้วมีโปรแกรมตัวหนึ่งที่เรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "คอมไพเลอร์ (compiler)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ทำหน้าที่แปลโค้ด C ของเราลงไปเป็น Assembly และ machine code ให้เองโดยอัตโนมัติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แต่จุดที่ทำให้ C เจ๋งจริงๆ คือเรื่องนี้ครับ — โค้ด C ชุดเดียวกันนี้ เราเอาไปคอมไพล์สำหรับชิป ARM ก็ได้ x86 ก็ได้ AVR ก็ได้ แค่เปลี่ยนคอมไพเลอร์ให้ตรงกับชิป โดยไม่ต้องเขียนโค้ดใหม่ ต่างจาก Assembly ที่ต้องเขียนใหม่ทุกครั้งที่เปลี่ยนชิป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "นี่แหละคือเหตุผลที่ C ลงตัวที่สุดสำหรับงานที่ต้องคุมฮาร์ดแวร์ มันใกล้ชิดฮาร์ดแวร์พอที่จะสั่งงานได้ละเอียด แต่ก็ยังเขียนเป็นภาษาที่คนเข้าใจได้ และย้ายข้ามชิปได้ มันเลยกลายเป็นภาษาหลักของงานระบบฝังตัว (Embedded System) มาจนถึงทุกวันนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาพรวมทั้งหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองมาดูเส้นทางทั้งหมดในภาพเดียวกันครับ ว่าโค้ดที่เราเขียนเดินทางลงไปจนถึงไฟฟ้าจริงได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สิ่งที่อยากให้จดจำจากภาพนี้คือ ยิ่งอยู่ชั้นบน มนุษย์ยิ่งเขียนง่าย แต่ก็ยิ่งห่างจากฮาร์ดแวร์ ส่วนยิ่งอยู่ชั้นล่าง ยิ่งคุมฮาร์ดแวร์ได้ละเอียด แต่ก็เขียนยากขึ้นเรื่อยๆ และไม่ว่าเราจะเขียนที่ชั้นไหน สุดท้ายทุกอย่างจะถูกแปลกลับลงมาเป็นไฟฟ้าเปิด-ปิดในวงจรจริงเสมอ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```markdown", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C          char al = 0x61;          ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← มนุษย์เขียน อ่านง่าย ย้ายข้ามชิปได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (คอมไพเลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "  Assembly         MOV AL, 61h              ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← ผูกกับ ISA ของชิปแล้ว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (แอสเซมเบลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " Machine Code   10110000 01100001           ← CPU อ่านได้โดยตรง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "   Hardware      ⚡ ไฟฟ้าเปิด/ปิดในวงจรจริง   ← LED ติด, มอเตอร์หมุน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลับมาที่คำถามตอนต้น ว่าคอมพิวเตอร์ \\"เข้าใจ\\" คำสั่งของเราได้อย่างไร ทั้งที่มันรู้จักแค่ไฟฟ้าเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบก็คือ มันไม่ได้เข้าใจเราโดยตรงเลย แต่มีชั้นของการแปลภาษาซ้อนกันอยู่หลายชั้น ตั้งแต่ภาษา C ที่เราเขียน ถูกแปลลงเป็น Assembly แล้วเป็น Machine Code และสุดท้ายกลายเป็นไฟฟ้าที่ไหลในวงจร แต่ละชั้นทำหน้าที่แปลภาษาให้อีกชั้นที่อยู่ต่ำกว่าเข้าใจ มันไม่ใช่เวทมนตร์ แต่เป็นระบบที่มนุษย์ค่อยๆ สร้างขึ้นมาอย่างชาญฉลาด เพื่อให้เราคุยกับเครื่องจักรได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "และถ้าคุณอ่านมาถึงตรงนี้แล้วรู้สึกว่าอยากลองเขียนโค้ด C สั่งให้ฮาร์ดแวร์ทำงานด้วยตัวเองดูบ้าง — สั่งให้ LED ติด อ่านค่าจากเซ็นเซอร์ หรือควบคุมมอเตอร์ — นี่แหละคือโลกของการเขียนโปรแกรมระบบฝังตัว ที่คุณเริ่มต้นได้แม้ไม่มีพื้นฐานมาก่อน เพราะตอนนี้คุณเข้าใจภาพใหญ่ทั้งหมดแล้วว่าทุกอย่างเชื่อมโยงกันอย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วพบกันในบทความถัดไปครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 05:24:28.939+00	2026-06-16 05:13:40.891+00	published	2026-06-16 05:24:30.28+00	2026-06-16 05:24:30.28+00	t	2026-06-16 06:30:00+00
5	4	จากไฟฟ้าเปิด-ปิด สู่โค้ดภาษา C: คอมพิวเตอร์เข้าใจเราได้อย่างไร?	electricity-to-c-code	\N	คอมพิวเตอร์รู้จักแค่ไฟฟ้าเปิดกับปิด แล้วมันเข้าใจโค้ดที่เราพิมพ์ได้อย่างไร? บทความนี้พาไขความลับทีละชั้น จาก Machine Code สู่ภาษา C แบบที่คนไม่มีพื้นฐานก็เข้าใจได้	17	\N	Photo by <a href="https://unsplash.com/@thefreak1337?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Valentin Petkov</a> on <a href="https://unsplash.com/photos/green-and-black-circuit-board-mYY0c9WKKk8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a> 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพตามนะครับ คุณพิมพ์โค้ดสั้นๆ ลงไปในคอมพิวเตอร์ กดปุ่มรัน แล้วไฟ LED ดวงเล็กๆ บนบอร์ดก็ติดขึ้นมา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูเป็นเรื่องธรรมดา แต่ถ้าเราหยุดคิดสักนิด มันน่าทึ่งไม่น้อย เพราะสิ่งที่อยู่ตรงหน้าคุณคือก้อนซิลิคอนกับกระแสไฟฟ้า มันไม่รู้จักภาษาไทย ไม่รู้จักภาษาอังกฤษ ไม่รู้ด้วยซ้ำว่า \\"ตัวอักษร\\" คืออะไร แล้วมัน \\"เข้าใจ\\" คำสั่งที่เราพิมพ์ลงไปได้อย่างไร?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบสั้นๆ คือ คอมพิวเตอร์ไม่ได้เข้าใจภาษาของเราเลยแม้แต่น้อย สิ่งเดียวที่มันเข้าใจคือไฟฟ้า \\"เปิด\\" กับ \\"ปิด\\" เท่านั้น บทความนี้จะพาคุณไขความลับทีละขั้น ว่าจากแค่สองสถานะง่ายๆ นี้ มันค่อยๆ กลายมาเป็นโค้ดที่เราเขียนกันได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกอย่างเริ่มจากไฟฟ้าสถานะเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลึกลงไปในชิปทุกตัว ไม่ว่าจะเป็นคอมพิวเตอร์ มือถือ หรือเครื่องซักผ้า แก่นแท้ของมันคือสวิตช์ไฟฟ้าจิ๋วจำนวนมหาศาล นับเป็นพันล้านตัว สวิตช์แต่ละตัวก็เหมือนสวิตช์ไฟในบ้านเรา คือมีแค่สองสถานะ — เปิด กับ ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราแทน \\"เปิด\\" ด้วยเลข 1 และ \\"ปิด\\" ด้วยเลข 0 และเจ้าเลขสองตัวนี้เอง — 0 กับ 1 — คือภาษาเดียวที่คอมพิวเตอร์เข้าใจจริงๆ เราเรียกมันว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เลขฐานสอง (binary)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณอาจสงสัยว่า แค่ 0 กับ 1 จะสื่อความหมายอะไรได้ ลองนึกถึงการส่งสัญญาณด้วยไฟฉายตอนกลางคืนดูครับ ไฟดวงเดียวเปิด-ปิดได้แค่สองแบบ แต่ถ้าเรามีไฟหลายดวงเรียงกัน แล้วกำหนดว่าแต่ละรูปแบบการเปิด-ปิดหมายถึงอะไร เราก็ส่งข้อความที่ซับซ้อนได้ คอมพิวเตอร์ก็ใช้หลักการเดียวกันเป๊ะ เพียงแต่ทำได้เร็วและมีจำนวน \\"หลอดไฟ\\" มากกว่ามหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Machine Code: ภาษาที่คอมพิวเตอร์เข้าใจ แต่มนุษย์ปวดหัว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อเราเอาเลข 0 กับ 1 มาเรียงต่อกันเป็นชุดตามกติกาที่กำหนดไว้ มันก็กลายเป็น \\"คำสั่ง\\" ที่สั่งให้ CPU ทำงานได้ ลองดูชุดเลขนี้ครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10110000 01100001", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับเราอาจดูเหมือนเลขมั่วๆ แต่สำหรับ CPU แล้ว นี่คือคำสั่งที่ชัดเจนหนึ่งคำสั่ง ประมาณว่า \\"เอาค่านี้ไปเก็บไว้ตรงนี้\\" เราเรียกเลขฐานสองที่เป็นคำสั่งแบบนี้ว่า **Machine Code** หรือภาษาเครื่อง มันคือสิ่งที่ CPU อ่านแล้วลงมือทำได้ทันที ไม่ต้องแปลอะไรอีก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ปัญหาคือ... ลองจินตนาการว่าคุณต้องเขียนโปรแกรมทั้งโปรแกรมด้วยเลข 0 กับ 1 แบบนี้ โปรแกรมจริงๆ มีคำสั่งเป็นแสนเป็นล้านบรรทัด ไม่มีมนุษย์คนไหนเขียนหรือจำไหว แค่พิมพ์ผิดไปตัวเดียวก็หาไม่เจอแล้ว นี่จึงเป็นจุดเริ่มต้นที่มนุษย์คิดค้น \\"ตัวช่วย\\" ขึ้นมาทีละชั้น เพื่อให้เขียนโปรแกรมได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA: เมนูคำสั่งประจำตัวของ CPU แต่ละรุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ก่อนจะไปดูตัวช่วย มีอีกเรื่องที่ต้องเข้าใจก่อน นั่นคือ CPU แต่ละแบบไม่ได้เข้าใจเลขฐานสองเหมือนกันหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เปรียบเหมือนร้านอาหารที่มีเมนูของตัวเอง ร้านหนึ่งสั่ง \\"เมนูเบอร์ 5\\" ได้ผัดกะเพรา อีกร้านสั่งเบอร์ 5 เดียวกันอาจได้ข้าวมันไก่ CPU ก็เช่นกัน เลขฐานสองชุดเดียวกันอาจหมายถึงคนละคำสั่งบน CPU คนละแบบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รายการคำสั่งทั้งหมดที่ CPU รุ่นหนึ่งๆ รองรับ — ว่าเลขชุดไหนหมายถึงคำสั่งอะไร มีที่เก็บข้อมูลชั่วคราว (register) อะไรบ้าง — เราเรียกรวมๆ ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ISA (Instruction Set Architecture) ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "หรือก็คือ \\"เมนู\\" ประจำตัวของ CPU นั่นเอง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA ที่เราเจอในชีวิตจริงก็มีหลายแบบ เช่น ARM ที่อยู่ในมือถือและบอร์ด STM32, x86 ที่อยู่ในคอมพิวเตอร์และโน้ตบุ๊ก หรือ AVR ที่อยู่ในบอร์ด Arduino ยอดนิยม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ประเด็นสำคัญที่ต้องจำคือ เพราะ CPU คนละ ISA มีเมนูคนละชุด โปรแกรม (machine code) ที่สร้างมาสำหรับชิปแบบหนึ่ง จึงเอาไปรันบนชิปอีกแบบไม่ได้ จำประเด็นนี้ไว้นะครับ เดี๋ยวมันจะกลับมาสำคัญมากตอนท้าย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Assembly: แปลงเลขให้เป็นคำที่พอจำได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "วช่วยชั้นแรกที่มนุษย์คิดขึ้นมา คือการเอา \\"คำย่อ\\" มาแทนเลขฐานสองแต่ละคำสั่ง เพื่อให้พออ่านรู้เรื่องและจำได้ เราเรียกภาษาชั้นนี้ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\"Assembly\\"", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ยกตัวอย่าง machine code ชุดเดิมที่เราเห็นไปก่อนหน้า เขียนเป็น Assembly ได้แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```asm", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "MOV AL, 61h    ; เอาค่า 0x61 ไปเก็บใน register ชื่อ AL", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MOV", "type": "text", "style": "", "detail": 0, "format": 16, "version": 1}, {"mode": "normal", "text": " มาจากคำว่า move เห็นแบบนี้พออ่านออกแล้วว่ามันกำลัง \\"ย้าย\\" ค่าไปไหนสักที่ ดีกว่ามานั่งไล่อ่าน 10110000 01100001 เยอะเลย และที่สำคัญคือ Assembly หนึ่งบรรทัดนี้ แปลตรงกลับไปเป็น machine code ชุดที่เราเห็นตอนแรกได้พอดี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 16}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูดีขึ้นเยอะ แต่ Assembly ก็ยังมีจุดที่ไม่สะดวกอยู่สองข้อ ข้อแรกคือมันยังต้องสั่งงานทีละขั้นเล็กๆ อย่างละเอียด งานง่ายๆ ในหัวเราอาจต้องเขียน Assembly หลายบรรทัด ข้อสองคือ — จำเรื่อง ISA ที่บอกให้จำไว้ได้ไหมครับ — Assembly ก็ยังผูกติดกับ ISA ของชิปแต่ละแบบอยู่ดี Assembly ของ ARM กับของ x86 ก็เขียนคนละแบบ ถ้าเปลี่ยนชิปก็ต้องเขียนใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C: จุดที่ลงตัวที่สุด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วเราก็มาถึงพระเอกของเรา — ภาษา C ซึ่งเป็นตัวช่วยอีกชั้นที่ยกระดับขึ้นไปอีก ใกล้เคียงภาษามนุษย์มากขึ้น คำสั่ง Assembly ที่เราเห็นเมื่อกี้ เขียนเป็นภาษา C ได้สั้นๆ แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```c", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "char al = 0x61", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อ่านปุ๊บก็พอเดาออกว่า \\"เก็บค่า 0x61 ลงในตัวแปรชื่อ al\\" เราไม่ต้องไปยุ่งกับ register หรือจำเมนูของ ISA ให้ปวดหัวอีกต่อไป เราเขียนสิ่งที่เราอยากให้เกิดขึ้น แล้วมีโปรแกรมตัวหนึ่งที่เรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "คอมไพเลอร์ (compiler)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ทำหน้าที่แปลโค้ด C ของเราลงไปเป็น Assembly และ machine code ให้เองโดยอัตโนมัติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แต่จุดที่ทำให้ C เจ๋งจริงๆ คือเรื่องนี้ครับ — โค้ด C ชุดเดียวกันนี้ เราเอาไปคอมไพล์สำหรับชิป ARM ก็ได้ x86 ก็ได้ AVR ก็ได้ แค่เปลี่ยนคอมไพเลอร์ให้ตรงกับชิป โดยไม่ต้องเขียนโค้ดใหม่ ต่างจาก Assembly ที่ต้องเขียนใหม่ทุกครั้งที่เปลี่ยนชิป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "นี่แหละคือเหตุผลที่ C ลงตัวที่สุดสำหรับงานที่ต้องคุมฮาร์ดแวร์ มันใกล้ชิดฮาร์ดแวร์พอที่จะสั่งงานได้ละเอียด แต่ก็ยังเขียนเป็นภาษาที่คนเข้าใจได้ และย้ายข้ามชิปได้ มันเลยกลายเป็นภาษาหลักของงานระบบฝังตัว (Embedded System) มาจนถึงทุกวันนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาพรวมทั้งหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองมาดูเส้นทางทั้งหมดในภาพเดียวกันครับ ว่าโค้ดที่เราเขียนเดินทางลงไปจนถึงไฟฟ้าจริงได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สิ่งที่อยากให้จดจำจากภาพนี้คือ ยิ่งอยู่ชั้นบน มนุษย์ยิ่งเขียนง่าย แต่ก็ยิ่งห่างจากฮาร์ดแวร์ ส่วนยิ่งอยู่ชั้นล่าง ยิ่งคุมฮาร์ดแวร์ได้ละเอียด แต่ก็เขียนยากขึ้นเรื่อยๆ และไม่ว่าเราจะเขียนที่ชั้นไหน สุดท้ายทุกอย่างจะถูกแปลกลับลงมาเป็นไฟฟ้าเปิด-ปิดในวงจรจริงเสมอ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C          char al = 0x61;          ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← มนุษย์เขียน อ่านง่าย ย้ายข้ามชิปได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (คอมไพเลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "  Assembly         MOV AL, 61h              ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← ผูกกับ ISA ของชิปแล้ว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (แอสเซมเบลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " Machine Code   10110000 01100001           ← CPU อ่านได้โดยตรง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "   Hardware      ⚡ ไฟฟ้าเปิด/ปิดในวงจรจริง   ← LED ติด, มอเตอร์หมุน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลับมาที่คำถามตอนต้น ว่าคอมพิวเตอร์ \\"เข้าใจ\\" คำสั่งของเราได้อย่างไร ทั้งที่มันรู้จักแค่ไฟฟ้าเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบก็คือ มันไม่ได้เข้าใจเราโดยตรงเลย แต่มีชั้นของการแปลภาษาซ้อนกันอยู่หลายชั้น ตั้งแต่ภาษา C ที่เราเขียน ถูกแปลลงเป็น Assembly แล้วเป็น Machine Code และสุดท้ายกลายเป็นไฟฟ้าที่ไหลในวงจร แต่ละชั้นทำหน้าที่แปลภาษาให้อีกชั้นที่อยู่ต่ำกว่าเข้าใจ มันไม่ใช่เวทมนตร์ แต่เป็นระบบที่มนุษย์ค่อยๆ สร้างขึ้นมาอย่างชาญฉลาด เพื่อให้เราคุยกับเครื่องจักรได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "และถ้าคุณอ่านมาถึงตรงนี้แล้วรู้สึกว่าอยากลองเขียนโค้ด C สั่งให้ฮาร์ดแวร์ทำงานด้วยตัวเองดูบ้าง — สั่งให้ LED ติด อ่านค่าจากเซ็นเซอร์ หรือควบคุมมอเตอร์ — นี่แหละคือโลกของการเขียนโปรแกรมระบบฝังตัว ที่คุณเริ่มต้นได้แม้ไม่มีพื้นฐานมาก่อน เพราะตอนนี้คุณเข้าใจภาพใหญ่ทั้งหมดแล้วว่าทุกอย่างเชื่อมโยงกันอย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วพบกันในบทความถัดไปครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 05:21:11.914+00	2026-06-16 05:13:40.891+00	draft	2026-06-16 05:21:11.914+00	2026-06-16 05:21:11.914+00	f	\N
4	4	จากไฟฟ้าเปิด-ปิด สู่โค้ดภาษา C: คอมพิวเตอร์เข้าใจเราได้อย่างไร?	electricity-to-c-code	\N	คอมพิวเตอร์รู้จักแค่ไฟฟ้าเปิดกับปิด แล้วมันเข้าใจโค้ดที่เราพิมพ์ได้อย่างไร? บทความนี้พาไขความลับทีละชั้น จาก Machine Code สู่ภาษา C แบบที่คนไม่มีพื้นฐานก็เข้าใจได้	17	\N	Photo by <a href="https://unsplash.com/@thefreak1337?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Valentin Petkov</a> on <a href="https://unsplash.com/photos/green-and-black-circuit-board-mYY0c9WKKk8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a> 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพตามนะครับ คุณพิมพ์โค้ดสั้นๆ ลงไปในคอมพิวเตอร์ กดปุ่มรัน แล้วไฟ LED ดวงเล็กๆ บนบอร์ดก็ติดขึ้นมา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูเป็นเรื่องธรรมดา แต่ถ้าเราหยุดคิดสักนิด มันน่าทึ่งไม่น้อย เพราะสิ่งที่อยู่ตรงหน้าคุณคือก้อนซิลิคอนกับกระแสไฟฟ้า มันไม่รู้จักภาษาไทย ไม่รู้จักภาษาอังกฤษ ไม่รู้ด้วยซ้ำว่า \\"ตัวอักษร\\" คืออะไร แล้วมัน \\"เข้าใจ\\" คำสั่งที่เราพิมพ์ลงไปได้อย่างไร?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบสั้นๆ คือ คอมพิวเตอร์ไม่ได้เข้าใจภาษาของเราเลยแม้แต่น้อย สิ่งเดียวที่มันเข้าใจคือไฟฟ้า \\"เปิด\\" กับ \\"ปิด\\" เท่านั้น บทความนี้จะพาคุณไขความลับทีละขั้น ว่าจากแค่สองสถานะง่ายๆ นี้ มันค่อยๆ กลายมาเป็นโค้ดที่เราเขียนกันได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกอย่างเริ่มจากไฟฟ้าสถานะเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลึกลงไปในชิปทุกตัว ไม่ว่าจะเป็นคอมพิวเตอร์ มือถือ หรือเครื่องซักผ้า แก่นแท้ของมันคือสวิตช์ไฟฟ้าจิ๋วจำนวนมหาศาล นับเป็นพันล้านตัว สวิตช์แต่ละตัวก็เหมือนสวิตช์ไฟในบ้านเรา คือมีแค่สองสถานะ — เปิด กับ ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราแทน \\"เปิด\\" ด้วยเลข 1 และ \\"ปิด\\" ด้วยเลข 0 และเจ้าเลขสองตัวนี้เอง — 0 กับ 1 — คือภาษาเดียวที่คอมพิวเตอร์เข้าใจจริงๆ เราเรียกมันว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เลขฐานสอง (binary)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณอาจสงสัยว่า แค่ 0 กับ 1 จะสื่อความหมายอะไรได้ ลองนึกถึงการส่งสัญญาณด้วยไฟฉายตอนกลางคืนดูครับ ไฟดวงเดียวเปิด-ปิดได้แค่สองแบบ แต่ถ้าเรามีไฟหลายดวงเรียงกัน แล้วกำหนดว่าแต่ละรูปแบบการเปิด-ปิดหมายถึงอะไร เราก็ส่งข้อความที่ซับซ้อนได้ คอมพิวเตอร์ก็ใช้หลักการเดียวกันเป๊ะ เพียงแต่ทำได้เร็วและมีจำนวน \\"หลอดไฟ\\" มากกว่ามหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Machine Code: ภาษาที่คอมพิวเตอร์เข้าใจ แต่มนุษย์ปวดหัว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อเราเอาเลข 0 กับ 1 มาเรียงต่อกันเป็นชุดตามกติกาที่กำหนดไว้ มันก็กลายเป็น \\"คำสั่ง\\" ที่สั่งให้ CPU ทำงานได้ ลองดูชุดเลขนี้ครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10110000 01100001", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับเราอาจดูเหมือนเลขมั่วๆ แต่สำหรับ CPU แล้ว นี่คือคำสั่งที่ชัดเจนหนึ่งคำสั่ง ประมาณว่า \\"เอาค่านี้ไปเก็บไว้ตรงนี้\\" เราเรียกเลขฐานสองที่เป็นคำสั่งแบบนี้ว่า **Machine Code** หรือภาษาเครื่อง มันคือสิ่งที่ CPU อ่านแล้วลงมือทำได้ทันที ไม่ต้องแปลอะไรอีก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ปัญหาคือ... ลองจินตนาการว่าคุณต้องเขียนโปรแกรมทั้งโปรแกรมด้วยเลข 0 กับ 1 แบบนี้ โปรแกรมจริงๆ มีคำสั่งเป็นแสนเป็นล้านบรรทัด ไม่มีมนุษย์คนไหนเขียนหรือจำไหว แค่พิมพ์ผิดไปตัวเดียวก็หาไม่เจอแล้ว นี่จึงเป็นจุดเริ่มต้นที่มนุษย์คิดค้น \\"ตัวช่วย\\" ขึ้นมาทีละชั้น เพื่อให้เขียนโปรแกรมได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA: เมนูคำสั่งประจำตัวของ CPU แต่ละรุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null}}	2026-06-16 05:13:40.892+00	2026-06-16 05:13:40.891+00	draft	2026-06-16 05:13:41.354+00	2026-06-16 05:13:41.354+00	f	\N
\.


--
-- Data for Name: _posts_v_rels; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms._posts_v_rels (id, "order", parent_id, path, categories_id, tags_id) FROM stdin;
1	1	1	version.categories	1	\N
2	1	1	version.tags	\N	4
3	2	1	version.tags	\N	5
4	3	1	version.tags	\N	1
5	1	2	version.categories	3	\N
6	1	2	version.tags	\N	3
7	1	3	version.categories	4	\N
8	1	3	version.tags	\N	1
9	2	3	version.tags	\N	2
\.


--
-- Data for Name: _projects_v; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms._projects_v (id, parent_id, version_title, version_slug, version_sub_title, version_excerpt, version_feature_image_image_id, version_feature_image_caption, version_feature_image_credits, version_body, version_parts_used, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, version_published_at) FROM stdin;
\.


--
-- Data for Name: _projects_v_rels; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms._projects_v_rels (id, "order", parent_id, path, categories_id, tags_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.categories (id, title, description, updated_at, created_at) FROM stdin;
1	3D Printing & Digital Fabrication	เจาะลึกเทคโนโลยีการขึ้นรูปชิ้นงาน 3 มิติ (FDM/Resin) การเลือกใช้วัสดุศาสตร์ขั้นสูง (ABS, Nylon, Carbon Fiber) และกระบวนการผลิตระบบดิจิทัล เช่น CNC และ Laser Cutting สำหรับงานวิศวกรรม	2026-06-03 19:59:36.258+00	2026-06-03 19:59:36.257+00
2	Mechanical Design & Kinematics	ศาสตร์แห่งโครงสร้างและการเคลื่อนที่ ตั้งแต่การออกแบบกลไกส่งกำลัง เฟือง สายพาน ระบบนิวเมติกส์ ไปจนถึงการคำนวณจลนศาสตร์ (Kinematics) ของหุ่นยนต์และการจำลองสถานการณ์ในโปรแกรม CAD	2026-06-03 20:00:05.343+00	2026-06-03 20:00:05.343+00
3	Electronics & Power Systems	ศูนย์รวมการออกแบบระบบฮาร์ดแวร์อิเล็กทรอนิกส์ การพัฒนาแผงวงจร (PCB Design) วงจรดิจิทัล และระบบอิเล็กทรอนิกส์กำลัง (Power Electronics) เพื่อการขับเคลื่อนมอเตอร์และบริหารจัดการพลังงานที่มีประสิทธิภาพ	2026-06-03 20:00:32.011+00	2026-06-03 20:00:32.011+00
4	Embedded Systems & Firmware	เจาะลึกการพัฒนาซอฟต์แวร์ระดับแนบแน่น (Firmware) การสถาปัตยกรรมไมโครคอนโทรลเลอร์ (STM32, ESP32, RP2040) ด้วยภาษาประสิทธิภาพสูงอย่าง C/C++ และ Rust เพื่อควบคุมฮาร์ดแวร์ในระดับ Low-level	2026-06-03 20:00:55.238+00	2026-06-03 20:00:55.238+00
5	Control Theory & Automation	เรียนรู้ทักษะการออกแบบระบบควบคุมอัตโนมัติ ทฤษฎีระบบควบคุมแบบปิด (Closed-loop Control) การจูนระบบ PID อัลกอริทึมการเคลื่อนที่ และการควบคุมระบบบัสสื่อสารความเร็วสูง เช่น CAN bus	2026-06-03 20:01:16.142+00	2026-06-03 20:01:16.14+00
6	Physical AI & Robotics	ขยายขีดความสามารถของฮาร์ดแวร์ด้วยปัญญาประดิษฐ์ การประยุกต์ใช้ Computer Vision, Machine Learning และระบบปฏิบัติการหุ่นยนต์ (ROS 2) เพื่อสร้างโมดูลสมองกลอัจฉริยะที่ปฏิสัมพันธ์กับโลกจริงได้	2026-06-03 20:01:42.223+00	2026-06-03 20:01:42.223+00
7	Build Logs & Prototyping	พื้นที่บันทึกขั้นตอนการสร้างโปรเจกต์และหุ่นยนต์ต้นแบบตั้งแต่ศูนย์ ถอดกระบวนการคิดแบบ First Principles ตั้งแต่การดราฟต์ไอเดีย เมคาทรอนิกส์อินทิเกรชัน ไปจนถึงการทดสอบเพื่ออกสู่ตลาดจริง	2026-06-03 20:02:02.896+00	2026-06-03 20:02:02.895+00
8	Engineering Failures & Lessons	ถอดบทเรียนจากความพังและความผิดพลาดในหน้างานจริง (Fail of the Week) ตั้งแต่พาร์ทหัก วงจรไหม้ ไปจนถึงบอร์ดพัง เพื่อเปลี่ยนความเสียหายทางวิศวกรรมให้เป็นองค์ความรู้ที่หาไม่ได้ในตำรา	2026-06-03 20:02:30.9+00	2026-06-03 20:02:30.9+00
9	Teardowns & Hardware Reviews	ชำแหละและแกะแผงวงจรอุปกรณ์โปรดักต์ระดับอุตสาหกรรมในตลาดเพื่อวิเคราะห์สถาปัตยกรรมภายใน พร้อมรีวิวเครื่องมือช่างและอุปกรณ์อำนวยความสะดวกสำหรับสายเดฟและฮาร์ดแวร์เมกเกอร์	2026-06-03 20:02:51.569+00	2026-06-03 20:02:51.569+00
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.media (id, alt, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, prefix) FROM stdin;
12	เครื่องพิมพ์ 3D สำหรับมือใหม่ · ตอนที่ 1 – เครื่องพิมพ์ 3D คืออะไร?	2026-06-08 16:32:50.217+00	2026-06-08 16:32:48.108+00	/api/media/file/snapmaker-3d-printer.webp	\N	snapmaker-3d-printer.webp	image/webp	103330	1280	854	50	50	articles/assets
13	ความแตกต่างหลักระหว่าง Additive และ Subtractive โดย Additive เป็นการ "เติมเนื้อวัสดุ" ขึ้นรูปทีละชั้น ในขณะที่ Subtractive เป็นการ "ตัดเนื้อวัสดุส่วนเกินออก" จากวัสดุก้อนใหญ่	2026-06-08 16:35:11.05+00	2026-06-08 16:35:08.421+00	/api/media/file/additive-subtractive.webp	\N	additive-subtractive.webp	image/webp	19148	1200	583	50	50	articles/assets
14	อุปกรณ์ Active vs Passive ต่างกันอย่างไร?	2026-06-08 16:36:09.251+00	2026-06-08 16:35:52.871+00	/api/media/file/active-vs-passive-electronic-components.webp	\N	active-vs-passive-electronic-components.webp	image/webp	301266	2560	1440	50	50	articles/assets
16	10 เครื่องมือที่คนทำ Embedded ต้องมีติดตัว (ฉบับมือใหม่ห้ามพลาด!)	2026-06-08 16:45:27.925+00	2026-06-08 16:45:25.096+00	/api/media/file/10-essential-tools-for-embedded-systems-beginners.webp	\N	10-essential-tools-for-embedded-systems-beginners.webp	image/webp	221780	1535	1024	50	50	articles/assets
17	Arduino UNO board	2026-06-16 05:13:31.327+00	2026-06-16 05:13:29.338+00	/api/media/file/valentin-petkov-mYY0c9WKKk8-unsplash.webp	\N	valentin-petkov-mYY0c9WKKk8-unsplash.webp	image/webp	244776	1280	1089	50	50	articles/assets
\.


--
-- Data for Name: payload_jobs; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_jobs (id, input, completed_at, total_tried, has_error, error, task_slug, queue, wait_until, processing, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: payload_jobs_log; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_jobs_log (_order, _parent_id, id, executed_at, completed_at, task_slug, task_i_d, input, output, state, error) FROM stdin;
\.


--
-- Data for Name: payload_kv; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_kv (id, key, data) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
9	\N	2026-06-05 08:41:19.285+00	2026-06-05 08:41:19.284+00
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_locked_documents_rels (id, "order", parent_id, path, posts_id, categories_id, tags_id, media_id, users_id, projects_id) FROM stdin;
17	\N	9	document	\N	\N	4	\N	\N	\N
18	\N	9	user	\N	\N	\N	\N	1	\N
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	20260603_192730_initial	1	2026-06-03 19:40:41.558+00	2026-06-03 19:40:41.554+00
2	20260605_180139	2	2026-06-05 18:05:40.78+00	2026-06-05 18:05:40.78+00
3	20260608_155405_add_prefix_to_media	3	2026-06-08 16:05:06.607+00	2026-06-08 16:05:06.606+00
4	20260615_144644_add_drafts_status	4	2026-06-15 15:09:40.89+00	2026-06-15 15:09:40.89+00
5	20260615_145551_add_scheduled_publish_and_published_at	4	2026-06-15 15:09:41.05+00	2026-06-15 15:09:41.05+00
6	dev	-1	2026-06-16 04:57:39.038+00	2026-06-16 04:55:20.173+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
1	collection-categories	{}	2026-06-03 19:43:05.001+00	2026-06-03 19:43:05+00
4	collection-tags	{}	2026-06-05 08:40:49.534+00	2026-06-05 08:40:49.534+00
5	collection-projects	{}	2026-06-08 15:34:31.977+00	2026-06-08 15:34:31.977+00
3	collection-media	{"limit": 10}	2026-06-08 15:37:04.426+00	2026-06-03 20:33:05.688+00
2	collection-posts	{"limit": 10}	2026-06-16 04:18:57.063+00	2026-06-03 20:11:03.849+00
6	collection-users	{}	2026-06-16 04:51:31.504+00	2026-06-16 04:51:31.503+00
7	nav	{"open": true}	2026-06-16 05:05:01.256+00	2026-06-16 04:56:14.62+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
1	\N	1	user	1
4	\N	4	user	1
5	\N	5	user	1
7	\N	3	user	1
8	\N	2	user	1
9	\N	6	user	1
11	\N	7	user	1
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.posts (id, title, slug, sub_title, excerpt, feature_image_image_id, feature_image_caption, feature_image_credits, body, updated_at, created_at, _status, published_at) FROM stdin;
3	เครื่องพิมพ์ 3D คืออะไร?	3d-printing-for-beginners-what-is-3d-printing	เครื่องพิมพ์ 3D สำหรับมือใหม่ · ตอนที่ 1	ทำความรู้จักเครื่องพิมพ์ 3D สำหรับมือใหม่ ว่าคืออะไร ทำงานอย่างไรด้วยหลักการสร้างทีละชั้น (Additive Manufacturing) และขั้นตอนคร่าว ๆ จากไอเดียสู่ของจริง	12	เครื่องพิมพ์ 3D พร้อมเครื่องมือและชิ้นงานในเวิร์กชอป		{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ซีรีส์เรียนรู้เครื่องพิมพ์ 3D ตั้งแต่ศูนย์ สำหรับคนที่ไม่เคยจับมาก่อน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพว่าคุณวาดของเล่นชิ้นหนึ่งบนคอมพิวเตอร์ แล้วกดปุ่มเดียว อีกไม่กี่ชั่วโมงต่อมาของชิ้นนั้นก็โผล่ออกมาเป็นวัตถุจริงที่จับต้องได้ วางบนฝ่ามือได้ นี่ไม่ใช่เรื่องในหนังวิทยาศาสตร์อีกต่อไป แต่คือสิ่งที่เครื่องพิมพ์ 3D ราคาหลักพันบาททำได้ในห้องนอนของคุณ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ในตอนแรกของซีรีส์นี้ เราจะปูพื้นฐานให้เข้าใจว่าเครื่องพิมพ์ 3D คืออะไร ทำงานอย่างไร และทำไมมันถึงเปลี่ยนวิธีที่เราสร้างสิ่งของไปอย่างสิ้นเชิง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " เครื่องพิมพ์ 3D คืออะไร", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องพิมพ์ 3D คืออุปกรณ์ที่สร้างวัตถุสามมิติขึ้นมาจากไฟล์ดิจิทัล โดยการ \\"เติม\\" วัสดุทีละน้อยจนกลายเป็นรูปร่างที่ต้องการ คำที่ใช้ในวงการคือ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Additive Manufacturing", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หรือ \\"การผลิตแบบเติมเนื้อ\\" ซึ่งเป็นหัวใจสำคัญที่ทำให้มันต่างจากเครื่องจักรแบบเดิม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "6a26ef3ffa2feba8be522feb", "type": "upload", "value": 13, "fields": null, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ชื่อ \\"เครื่องพิมพ์\\" อาจทำให้เข้าใจผิดได้นิดหน่อย เพราะมันไม่ได้พิมพ์ตัวหนังสือลงกระดาษ แต่ถ้ามองในแง่หลักการแล้วก็คล้ายกัน เครื่องพิมพ์กระดาษทั่วไปวางหมึกเป็นจุดเล็ก ๆ จนเกิดเป็นภาพบนพื้นผิวสองมิติ ส่วนเครื่องพิมพ์ 3D ก็วางวัสดุเป็นชั้น ๆ ซ้อนกันขึ้นไปจนเกิดเป็นวัตถุในสามมิติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " หลักการทำงาน: สร้างทีละชั้น", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หัวใจของเครื่องพิมพ์ 3D เกือบทุกชนิดคือแนวคิดเดียวกัน นั่นคือ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "การสร้างวัตถุทีละชั้น (layer by layer)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกถึงขนมเค้กหลายชั้น หรือกองแพนเค้กที่วางซ้อนกัน วัตถุที่พิมพ์ออกมาก็เกิดจากหลักการเดียวกัน เครื่องจะแบ่งโมเดลสามมิติออกเป็นชั้นบาง ๆ แนวนอนหลายร้อยหรือหลายพันชั้น แล้วค่อย ๆ สร้างทีละชั้นจากล่างขึ้นบน เมื่อชั้นหนึ่งเสร็จ เครื่องก็ขยับขึ้นไปเล็กน้อยแล้วเริ่มสร้างชั้นถัดไปทับลงไป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ความบางของแต่ละชั้นเรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ความละเอียดของชั้น (layer height)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " โดยทั่วไปอยู่ที่ประมาณ 0.1 ถึง 0.3 มิลลิเมตร ยิ่งชั้นบาง ผิวงานก็ยิ่งเรียบเนียนและเก็บรายละเอียดได้ดี แต่ก็ใช้เวลาพิมพ์นานขึ้นตามไปด้วย นี่คือการแลกเปลี่ยนที่คุณจะเจอบ่อยมากในโลกของการพิมพ์ 3D คือคุณภาพแลกกับเวลา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ขั้นตอนคร่าว ๆ จากไอเดียสู่ของจริง", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เพื่อให้เห็นภาพรวม กระบวนการพิมพ์ 3D มักประกอบด้วยสามขั้นตอนหลัก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขั้นแรกคือการได้มาซึ่ง ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "โมเดลสามมิติ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ซึ่งอาจมาจากการออกแบบเองด้วยโปรแกรม CAD การสแกนวัตถุจริง หรือดาวน์โหลดไฟล์สำเร็จรูปที่คนอื่นทำไว้แล้ว ไฟล์เหล่านี้มักอยู่ในนามสกุล `.stl` หรือ `.obj`", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขั้นที่สองคือการนำโมเดลไปผ่านโปรแกรมที่เรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Slicer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ซึ่งทำหน้าที่ \\"หั่น\\" โมเดลออกเป็นชั้น ๆ และแปลงเป็นชุดคำสั่งที่เครื่องเข้าใจ เรียกว่า G-code ในขั้นนี้คุณจะกำหนดค่าต่าง ๆ เช่น ความละเอียด ความหนาแน่นภายในชิ้นงาน และความเร็วในการพิมพ์", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขั้นที่สามคือการส่ง G-code เข้าเครื่องแล้ว ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เริ่มพิมพ์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " จากนั้นก็รอให้เครื่องค่อย ๆ สร้างชิ้นงานขึ้นมาทีละชั้นจนเสร็จสมบูรณ์", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราจะลงรายละเอียดของแต่ละขั้นตอนนี้ในตอนต่อ ๆ ไป ตอนนี้แค่ให้เห็นภาพรวมก็พอ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมเครื่องพิมพ์ 3D ถึงน่าสนใจ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สิ่งที่ทำให้เทคโนโลยีนี้พิเศษคือมันเปิดโอกาสให้คนธรรมดาผลิตของใช้เองได้ โดยไม่ต้องพึ่งโรงงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสามารถสร้างของที่ไม่มีขายในท้องตลาด เช่น อะไหล่พลาสติกชิ้นเล็ก ๆ ที่หักไป ที่วางของแบบเฉพาะตัว หรือของเล่นตามจินตนาการ การผลิตทีละชิ้นแบบนี้ในแบบเดิมต้องใช้แม่พิมพ์ราคาแพงและสั่งขั้นต่ำเป็นพัน ๆ ชิ้น แต่เครื่องพิมพ์ 3D ผลิตชิ้นเดียวก็คุ้มค่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "นอกจากนี้มันยังเป็นเครื่องมือสร้างต้นแบบที่ทรงพลัง นักออกแบบและวิศวกรใช้พิมพ์ตัวอย่างเพื่อทดลองและปรับแก้ก่อนผลิตจริง ลดทั้งเวลาและต้นทุนได้มหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องพิมพ์ 3D ทำอะไรไม่ได้บ้าง", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เพื่อตั้งความคาดหวังให้ถูกต้อง เครื่องพิมพ์ 3D สำหรับใช้ที่บ้านก็มีข้อจำกัด มันไม่ใช่เครื่องเสกของได้ทุกอย่าง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ชิ้นงานส่วนใหญ่ทำจากพลาสติก จึงไม่แข็งแรงเท่าโลหะหรือชิ้นงานที่ผลิตจากโรงงาน การพิมพ์หนึ่งชิ้นใช้เวลาเป็นชั่วโมงหรือหลายชั่วโมง จึงไม่เหมาะกับการผลิตจำนวนมาก และผิวงานที่ได้มักมีเส้นชั้นให้เห็น ไม่เรียบเนียนเหมือนของฉีดขึ้นรูปจากโรงงาน เว้นแต่จะนำไปขัดแต่งเพิ่ม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แต่สำหรับมือใหม่ ข้อจำกัดเหล่านี้ไม่ใช่ปัญหาเลย เพราะเสน่ห์ของมันอยู่ที่การได้ลงมือสร้างของด้วยตัวเองมากกว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุปตอนที่ 1", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องพิมพ์ 3D คือเครื่องที่สร้างวัตถุสามมิติด้วยการเติมวัสดุทีละชั้นจากล่างขึ้นบน ตามแบบจากไฟล์ดิจิทัล กระบวนการหลักมีสามขั้น คือ ได้โมเดล นำไปสไลซ์ และพิมพ์ออกมา มันทรงพลังในแง่ที่ให้คนธรรมดาผลิตของเองได้ แม้จะมีข้อจำกัดด้านความแข็งแรงและความเร็วอยู่บ้าง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ในตอนต่อไป เราจะเจาะลึกว่าเครื่องพิมพ์ 3D มีกี่ประเภท และแต่ละแบบเหมาะกับใคร เพื่อช่วยให้คุณเลือกได้ถูกตั้งแต่ก่อนเริ่มต้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตอนที่ 2: ประเภทของเครื่องพิมพ์ 3D — FDM กับ Resin ต่างกันอย่างไร (เร็ว ๆ นี้)", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}], "direction": null}}	2026-06-16 04:57:39.591+00	2026-06-04 06:11:52.488+00	published	2026-06-04 06:11:52.488+00
2	อุปกรณ์ Active vs Passive ต่างกันอย่างไร?	active-vs-passive-electronic-components	\N	ทำความเข้าใจความแตกต่างระหว่างอุปกรณ์อิเล็กทรอนิกส์ Active และ Passive ทั้งคุณสมบัติ หน้าที่ และตัวอย่างอุปกรณ์ พร้อมตารางเปรียบเทียบที่เข้าใจง่าย	14	\N	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"type": "linebreak", "version": 1}, {"mode": "normal", "text": "ทำความเข้าใจความแตกต่างระหว่างอุปกรณ์อิเล็กทรอนิกส์ Active และ Passive", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ในโลกของอิเล็กทรอนิกส์ที่ซับซ้อน อุปกรณ์ต่างๆ มีบทบาทสำคัญในการทำงานของวงจรไฟฟ้า อุปกรณ์เหล่านี้สามารถแบ่งออกเป็นสองประเภทหลักๆ ได้แก่ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "**อุปกรณ์ Active (Active Components)**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " และ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "**อุปกรณ์ Passive (Passive Components)**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " การทำความเข้าใจความแตกต่างระหว่างอุปกรณ์ทั้งสองประเภทนี้เป็นสิ่งสำคัญสำหรับทุกคนที่สนใจในสาขาวิทยาการอิเล็กทรอนิกส์ ไม่ว่าจะเป็นนักเรียน นักพัฒนา หรือผู้ที่ชื่นชอบงานอดิเรก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Active (Active Components) คืออะไร?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Active คือชิ้นส่วนอิเล็กทรอนิกส์ที่ต้องการแหล่งพลังงานภายนอกเพื่อทำงาน และมีความสามารถในการควบคุมการไหลของกระแสไฟฟ้า หรือขยายสัญญาณไฟฟ้าได้ อุปกรณ์เหล่านี้มักจะทำหน้าที่เป็น \\"สมอง\\" หรือ \\"หัวใจ\\" ของวงจร ทำให้วงจรสามารถประมวลผลสัญญาณ สร้างสัญญาณ หรือขยายกำลังได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสมบัติหลักของอุปกรณ์ Active:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ต้องการพลังงานภายนอก:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " อุปกรณ์ Active ไม่สามารถทำงานได้ด้วยตัวเอง ต้องอาศัยแหล่งจ่ายไฟภายนอก เช่น แบตเตอรี่ หรือแหล่งจ่ายไฟกระแสตรง (DC power supply)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สามารถขยายสัญญาณได้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หนึ่งในคุณสมบัติที่สำคัญที่สุดคือความสามารถในการขยายสัญญาณไฟฟ้า ทำให้สัญญาณอ่อนๆ มีความแรงเพิ่มขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ควบคุมการไหลของกระแสไฟฟ้า:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " อุปกรณ์เหล่านี้สามารถควบคุมทิศทางและปริมาณของกระแสไฟฟ้าที่ไหลผ่านวงจรได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สร้างสัญญาณหรือสลับสถานะ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " สามารถสร้างสัญญาณไฟฟ้า หรือทำหน้าที่เป็นสวิตช์อิเล็กทรอนิกส์เพื่อเปิดหรือปิดวงจรได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวอย่างของอุปกรณ์ Active:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทรานซิสเตอร์ (Transistors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เป็นอุปกรณ์หลักที่ใช้ในการขยายสัญญาณและสลับสถานะในวงจรดิจิทัลและอนาล็อก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไดโอด (Diodes):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ยอมให้กระแสไฟฟ้าไหลผ่านได้ในทิศทางเดียว และใช้ในการแปลงกระแสสลับเป็นกระแสตรง (Rectification)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "วงจรรวม (Integrated Circuits - ICs):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หรือที่เรียกว่าชิป เป็นการรวมอุปกรณ์ Active และ Passive จำนวนมากเข้าไว้ด้วยกันบนแผ่นซิลิคอนขนาดเล็ก เพื่อทำหน้าที่ที่ซับซ้อน เช่น ไมโครโปรเซสเซอร์ หรือหน่วยความจำ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Passive (Passive Components) คืออะไร?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ Passive คือชิ้นส่วนอิเล็กทรอนิกส์ที่ไม่ต้องการแหล่งพลังงานภายนอกเพื่อทำงาน และไม่สามารถขยายสัญญาณไฟฟ้าได้ หน้าที่หลักของอุปกรณ์เหล่านี้คือการจัดเก็บ การกระจาย หรือการกรองพลังงานไฟฟ้าในวงจร พวกมันจะตอบสนองต่อสัญญาณไฟฟ้าที่เข้ามา แต่ไม่สามารถเพิ่มพลังงานให้กับสัญญาณนั้นได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสมบัติหลักของอุปกรณ์ Passive:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่ต้องใช้พลังงานภายนอก: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "อุปกรณ์ Passive สามารถทำงานได้โดยไม่ต้องมีแหล่งจ่ายไฟแยกต่างหาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขยายสัญญาณไม่ได้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ไม่มีความสามารถในการขยายสัญญาณไฟฟ้าที่ไหลผ่าน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จัดเก็บหรือกระจายพลังงาน:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ทำหน้าที่ในการจัดเก็บพลังงาน (เช่น ในตัวเก็บประจุ) หรือกระจายพลังงานในรูปของความร้อน (เช่น ในตัวต้านทาน)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่สามารถควบคุมกระแสไฟฟ้าได้โดยตรง:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " พวกมันจะต้านทานหรือจัดเก็บพลังงานตามคุณสมบัติทางกายภาพของมัน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวอย่างของอุปกรณ์ Passive:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวต้านทาน (Resistors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ใช้ในการจำกัดการไหลของกระแสไฟฟ้าและลดแรงดันไฟฟ้าในวงจร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเก็บประจุ (Capacitors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ใช้ในการจัดเก็บพลังงานไฟฟ้าในรูปของสนามไฟฟ้า และสามารถบล็อกกระแสตรงในขณะที่ยอมให้กระแสสลับผ่านได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเหนี่ยวนำ (Inductors):", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ใช้ในการจัดเก็บพลังงานไฟฟ้าในรูปของสนามแม่เหล็ก และสามารถต้านทานการเปลี่ยนแปลงของกระแสไฟฟ้าได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ตารางเปรียบเทียบ: Active vs Passive Components", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณสมบัติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Active Components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Passive Components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การใช้พลังงานภายนอก", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ต้องใช้พลังงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่ต้องใช้พลังงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การขยายสัญญาณ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สามารถขยายได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ขยายไม่ได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หน้าที่หลัก", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ควบคุมการไหลของกระแสไฟฟ้า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เก็บ/ระบายพลังงาน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวอย่าง", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทรานซิสเตอร์, ไดโอด, IC ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวต้านทาน, ตัวเก็บประจุ, ตัวเหนี่ยวนำ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [219, 248, 309], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุป", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การแยกแยะระหว่างอุปกรณ์ Active และ Passive เป็นพื้นฐานสำคัญในการออกแบบและวิเคราะห์วงจรอิเล็กทรอนิกส์ อุปกรณ์ Active ทำหน้าที่เป็นส่วนควบคุมและขยายสัญญาณ ทำให้วงจรมีชีวิตชีวาและสามารถทำงานที่ซับซ้อนได้ ในขณะที่อุปกรณ์ Passive ทำหน้าที่เป็นส่วนสนับสนุนในการจัดเก็บ จัดการ และกรองพลังงาน ทำให้วงจรมีความเสถียรและทำงานได้อย่างถูกต้อง การทำงานร่วมกันของอุปกรณ์ทั้งสองประเภทนี้ทำให้เกิดอุปกรณ์อิเล็กทรอนิกส์ที่หลากหลายและซับซ้อนที่เราใช้ในชีวิตประจำวัน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หวังว่าบทความนี้จะช่วยให้คุณเข้าใจความแตกต่างที่สำคัญระหว่างอุปกรณ์อิเล็กทรอนิกส์ Active และ Passive ได้ชัดเจนยิ่งขึ้น หากมีข้อสงสัยเพิ่มเติม สามารถสอบถามได้เลย!", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 04:57:40.282+00	2026-06-04 05:47:10.567+00	published	2026-06-04 05:47:10.567+00
1	10 เครื่องมือที่คนทำ Embedded ต้องมีติดตัว (ฉบับมือใหม่ห้ามพลาด!)	10-tools-for-beginner-embedded-systems		รวม 10 เครื่องมือที่จำเป็นสำหรับการทำ Embedded Systems ทั้งซอฟต์แวร์และฮาร์ดแวร์ จัดหมวดหมู่ให้ครบ เหมาะสำหรับมือใหม่ที่อยากเริ่มต้นอย่างถูกต้อง	16	10 เครื่องมือที่คนทำ Embedded ต้องมีติดตัว	\N	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ถ้าอยากเริ่มต้นทำโปรเจกต์ Embedded Systems จริงจัง เครื่องมือที่ถูกต้องจะช่วยให้ประหยัดเวลา debug ได้เป็นชั่วโมง และลดโอกาสทำวงจรพังโดยไม่รู้สาเหตุ บทความนี้รวม 10 เครื่องมือที่จำเป็นที่สุด จัดหมวดหมู่ให้เรียบร้อย ซื้อตามลำดับความสำคัญได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หมวดที่ 1 — ซอฟต์แวร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เริ่มจากสิ่งที่ไม่ต้องเสียเงินก่อน ซอฟต์แวร์ส่วนใหญ่มีเวอร์ชันฟรีให้ใช้ได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1. IDE — โปรแกรมเขียนโค้ด", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IDE ย่อมาจาก ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Integrated Development Environment", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " หรือพูดง่าย ๆ ก็คือ \\"โปรแกรมที่รวมทุกอย่างสำหรับเขียนโค้ดไว้ในที่เดียว\\" ไม่ว่าจะเป็นการพิมพ์โค้ด, ตรวจ error, หรือ compile โปรแกรม ทำได้หมดในหน้าต่างเดียว ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IDE ที่ดีจะขีดเส้นใต้ตรงที่โค้ดผิด เตือนก่อนที่จะ compile บอกให้รู้ว่าลืมปิดวงเล็บ หรือพิมพ์ชื่อตัวแปรผิด สิ่งเหล่านี้ฟังดูเล็กน้อย แต่ช่วยประหยัดเวลาได้มากมายในระยะยาว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ: ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "IDE", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เหมาะกับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino IDE", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino, ESP32 (มือใหม่มาก)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "PlatformIO", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino, ESP32, STM32 (ยืดหยุ่นกว่า)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32CubeIDE", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32 โดยเฉพาะ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Keil MDK", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ARM-based chips (มืออาชีพ)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มีแบบฟรีจำกัด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [235, 239, 246], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เริ่มจาก ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "**Arduino IDE**", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ก่อนเลย ติดตั้งง่าย ใช้งานง่าย และมีตัวอย่างโค้ดให้เพียบ พอชำนาญแล้วค่อยย้ายไป PlatformIO หรือ STM32CubeIDE", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2. PCB Design Software — โปรแกรมออกแบบแผงวงจร", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อไหร่ก็ตามที่โปรเจกต์ซับซ้อนขึ้น การต่อสายบน breadboard จะเริ่มยุ่งเหยิง ขั้นตอนต่อไปคือการออกแบบ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "PCB (Printed Circuit Board) ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "หรือแผงวงจรพิมพ์ ซึ่งต้องใช้โปรแกรมเฉพาะ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "โปรแกรมออกแบบ PCB ที่ดีช่วยให้วางตำแหน่งชิ้นส่วนได้ถูกต้อง, จัดการสายไฟได้เป็นระเบียบ, และส่งออกไฟล์ไปผลิต PCB จริงได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "โปรแกรม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จุดเด่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "KiCAD", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี 100%, ฟีเจอร์ครบ, ชุมชนใหญ่ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Eagle", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฐานผู้ใช้เยอะ, tutorial เพียบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟรีแบบจำกัด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Altium Designer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มาตรฐานอุตสาหกรรม ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แพง (สำหรับมืออาชีพ)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [234, 217, 251], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "KiCAD ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "เป็นตัวเลือกที่ดีที่สุดสำหรับผู้เริ่มต้น ฟรีทั้งหมด ไม่มีล็อคฟีเจอร์ และมีชุมชนคอยช่วยเหลือมากมาย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3. Debugger/Programmer — ดีบักเกอร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ดีบักเกอร์คืออุปกรณ์ (และซอฟต์แวร์) ที่ช่วยให้คุณ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "รันโค้ดทีละบรรทัด", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " และดูว่าตัวแปรแต่ละตัวมีค่าอะไรในระหว่างการทำงาน แทนที่จะต้องเดาว่า bug อยู่ตรงไหน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพว่าโค้ดรันแล้วทำงานผิดพลาด ถ้าไม่มีดีบักเกอร์ก็ต้องเพิ่มบรรทัด `Serial.print()` ไปเรื่อย ๆ เพื่อดูว่าโค้ดไปถึงไหน แต่ถ้ามีดีบักเกอร์ กดหยุดได้เลย ดูค่าตัวแปรทุกตัวได้ทันที ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกตามชิปที่ใช้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ชิป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ดีบักเกอร์แนะนำ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ST-Link V2", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ARM ทั่วไป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "J-Link", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "PIC/dsPIC", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "PICKit2 หรือ PICKit3", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino/ESP32", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มี built-in ผ่าน USB ได้เลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [218, 364], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "⚠️ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "หมายเหตุ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ยังไม่มีดีบักเกอร์ตัวเดียวที่ใช้ได้กับทุกชิป เลือกให้ตรงกับบอร์ดที่ใช้งานก่อนซื้อ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หมวดที่ 2 — เครื่องมือวัดสัญญาณ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เครื่องมือในหมวดนี้ช่วยให้คุณ \\"มองเห็น\\" สิ่งที่เกิดขึ้นในวงจรจริง ๆ ซึ่งแค่ดูโค้ดอย่างเดียวไม่มีทางรู้ได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "4. Multimeter — มัลติมิเตอร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " มัลติมิเตอร์คือเพื่อนแท้ของนักอิเล็กทรอนิกส์ทุกคน ใช้วัดได้ทั้งแรงดันไฟฟ้า (Voltage), กระแสไฟฟ้า (Current), และความต้านทาน (Resistance) ในตัวเดียว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกครั้งที่วงจรทำงานผิดพลาด คำถามแรกที่ต้องถามคือ \\"ไฟถึงจุดนี้มั้ย?\\" และมัลติมิเตอร์คือตัวตอบคำถามนั้น ใช้ตรวจสอบว่าสายต่อถูกหรือเปล่า, วงจรลัดหรือเปล่า, หรือชิ้นส่วนตัวไหนเสีย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ระดับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคาโดยประมาณ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "CD800A / DT830", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่ / งบจำกัด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "200–400 บาท", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Uni-T UT61E", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลาง / คุ้มค่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1,500–2,000 บาท", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Fluke 117", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มืออาชีพ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5,000+ บาท ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [216, 234, 221], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เริ่มจากตัวราคา 200–400 บาทก็ใช้ได้ดีในช่วงเรียนรู้ พอมั่นใจแล้วว่าจะใช้จริงจังค่อยอัปเกรดเป็น Fluke", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5. Oscilloscope — ออสซิลโลสโคป", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ออสซิลโลสโคปคือเครื่องมือที่ทำให้คุณ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\"มองเห็น\\" ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "สัญญาณไฟฟ้าในแบบ real-time แกน X คือเวลา แกน Y คือแรงดัน แค่นี้เองแต่มันเปิดโลกมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มัลติมิเตอร์บอกได้แค่ว่า \\"ตอนนี้มีไฟกี่โวลต์\\" แต่ออสซิลโลสโคปบอกได้ว่าสัญญาณมีรูปร่างเป็นยังไง มีสัญญาณรบกวนมั้ย ความถี่เท่าไหร่ สิ่งเหล่านี้สำคัญมากเมื่อทำงานกับ PWM, สัญญาณเสียง, หรือการสื่อสารดิจิทัล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จุดเด่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "FNIRSI DSO152", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "พกพาได้, ราคาถูก, เหมาะมือใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "HANMATEK DOS1102", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ความถี่ 110 MHz, ประสิทธิภาพดี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Owon SDS200", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ระดับกลาง, ครบฟีเจอร์", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [295, 358], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "6. Logic Analyzer — ลอจิกอนาไลเซอร์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ออสซิลโลสโคปดูสัญญาณแบบ analog ได้ดี แต่ถ้าอยากถอดรหัสการสื่อสารดิจิทัลอย่าง ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "SPI, I2C, UART, CAN ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "ต้องใช้ Logic Analyzer แทน มันจะแปลงสัญญาณดิบให้กลายเป็นข้อมูลที่อ่านออก เช่น \\"ไมโครคอนโทรลเลอร์ส่ง 0x3F ไปให้เซนเซอร์\\"", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ถ้าเคยทดลองต่อ Sensor ผ่าน I2C แล้วไม่มีข้อมูลขึ้นมาเลย โดยไม่รู้ว่าปัญหาอยู่ที่โค้ดหรือสายไฟ Logic Analyzer จะบอกได้ทันทีว่าสัญญาณถูกส่งออกไปหรือเปล่า และค่าที่ส่งไปถูกต้องมั้ย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ระดับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "งบน้อย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "USB Logic Analyzer 8-channel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ต่ำกว่า $25", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลาง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Saleae Compatible", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$30–60", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มืออาชีพ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Saleae Logic Pro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$500+", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [186, 183, 246], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "USB Logic Analyzer ราคาต่ำกว่า $25 ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "เพียงพอมากสำหรับการ debug งาน SPI/I2C/UART ทั่วไปในช่วงเรียนรู้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "หมวดที่ 3 — ฮาร์ดแวร์และอุปกรณ์", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อุปกรณ์ฮาร์ดแวร์ที่ต้องมีประจำโต๊ะทำงาน ตั้งแต่แหล่งจ่ายไฟไปจนถึงบอร์ดทดลอง ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "7. Power Supply — แหล่งจ่ายไฟ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แหล่งจ่ายไฟแบบ bench (ตั้งโต๊ะ) ที่ปรับแรงดันและกระแสได้เองนั้น สำคัญกว่าที่คิดมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ถ้าใช้แบตเตอรี่หรือ adapter ทั่วไปเป็นแหล่งจ่ายไฟ จะไม่รู้เลยว่าตอนนี้วงจรกินกระแสเท่าไหร่ แต่ถ้ามี bench PSU จะเห็นตัวเลขกระแสและแรงดันแบบ real-time และที่สำคัญคือ ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ตั้งค่า Current Limit ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "ได้ ป้องกันวงจรไหม้เมื่อต่อผิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "DC Regulated Bench Power Supply ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (หาได้ทั่วไปใน Shopee/Lazada)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "BSIDE DC Laboratory PSU", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — ดีไซน์สะอาด จออ่านง่าย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เคล็ดลับ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เลือก PSU ที่แสดงทั้งแรงดันและกระแสพร้อมกัน และมีปุ่มตั้ง Current Limit ได้ ฟีเจอร์นี้สำคัญมากสำหรับมือใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "8. Soldering Station — สถานีบัดกรี", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "บัดกรีเป็นทักษะพื้นฐานของทุกคนที่ทำ hardware และ สถานีบัดกรีที่ดีทำให้งานออกมาสะอาดและน่าเชื่อถือกว่าการใช้เหล็กแร่ธรรมดามาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เหล็กแร่ราคาถูกมักควบคุมอุณหภูมิไม่ได้ ทำให้ร้อนเกินไปและเผา pad บน PCB หรือร้อนไม่พอทำให้ตะกั่วไม่ละลาย สถานีบัดกรีที่ดีควบคุมอุณหภูมิได้แม่นยำ ช่วยให้งานออกมาดีขึ้นทันที", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ตัวเลือกแนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "จุดเด่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "AIFEN A9E", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ควบคุมอุณหภูมิดีเยี่ยม, ร้อนเร็ว, แนะนำมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "YIHUA 926 III", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ราคาเป็นมิตร, ใช้งานได้ดีสำหรับงานทั่วไป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [216, 247], "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " เริ่มจากเหล็กแร่ธรรมดาได้ถ้างบจำกัด แต่ถ้าจะลงทุนสักตัว สถานีบัดกรีคืนทุนไวมากเพราะใช้บ่อยที่สุดในบรรดาเครื่องมือทั้งหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "9. Passive Components — ชิ้นส่วนอิเล็กทรอนิกส์พื้นฐาน", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "\\"Passive Components\\" หรือชิ้นส่วนที่ไม่ต้องการไฟเลี้ยงเอง ได้แก่ ตัวต้านทาน (Resistor), ตัวเก็บประจุ (Capacitor), และตัวเหนี่ยวนำ (Inductor) สิ่งเหล่านี้มีอยู่ในเกือบทุกวงจร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตอนออกแบบวงจรจริงมักจะต้องการค่าที่จำเพาะมาก และถ้าไม่มีสต็อกไว้ก็ต้องรอสั่งซื้อ ทำให้โปรเจกต์สะดุดได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แนะนำให้สต็อกไว้:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวต้านทาน (Resistors)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ค่ามาตรฐานอนุกรม E24 ครบชุด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Package: through-hole สำหรับมือใหม่, SMD 0805 เมื่อชำนาญขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กำลัง: 0.25W และ 0.5W", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเก็บประจุ (Capacitors)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่มีขั้ว (Ceramic): 10nF, 100nF, 1μF — สำหรับ bypass/decoupling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มีขั้ว (Electrolytic): 10μF, 100μF, 470μF, 1000μF — สำหรับกรองไฟ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ตัวเหนี่ยวนำ (Inductors)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10μH, 100μH, 330μH — ค่าทั่วไปที่ใช้บ่อย ไม่ต้องสต็อกมาก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เคล็ดลับประหยัดเงิน:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ไม่ต้องซื้อทุกค่าพร้อมกัน ซื้อเพิ่มทีละนิดเมื่อเริ่มโปรเจกต์ใหม่ สักพักก็จะมีสต็อกครบเอง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10. Development Board — บอร์ดพัฒนา", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "บอร์ดพัฒนาคือ \\"สนามเด็กเล่น\\" ของวิศวกร Embedded มีชิปไมโครคอนโทรลเลอร์พร้อม USB, หน้าจอ, และอุปกรณ์ต่าง ๆ มาให้ครบในบอร์ดเดียว เปิดขึ้นมาก็เขียนโค้ดได้เลยโดยไม่ต้องบัดกรีอะไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ทำไมถึงสำคัญ?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "การทดลองบนบอร์ดพัฒนาก่อนทำ PCB จริงช่วยประหยัดทั้งเงินและเวลาได้มหาศาล ถ้าโค้ดหรือวงจรมีปัญหาก็แก้ได้ง่าย ๆ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ตัวเลือกแนะนำตามระดับ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับมือใหม่:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Arduino Uno / Nano", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — เริ่มต้นที่ดีที่สุด ชุมชนใหญ่ บทเรียนเพียบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ESP32 / NodeMCU", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — มี Wi-Fi และ Bluetooth ในตัว เหมาะกับงาน IoT", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับผู้ที่ต้องการมากกว่านั้น:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "STM32 Nucleo / Blue Pill", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — ชิปอุตสาหกรรม, ฟีเจอร์ครบ, ราคาไม่แพง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Raspberry Pi", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — รัน Linux ได้เลย เหมาะกับงาน Edge Computing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับงาน AI / ML:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "NVIDIA Jetson Nano ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "— ประมวลผล AI บน Edge ได้จริง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null, "textFormat": 1}, {"type": "quote", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "มือใหม่แนะนำ:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Arduino Uno ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "ราคาหลักร้อยบาท มีบทเรียนฟรีบนอินเทอร์เน็ตนับพัน เริ่มตรงนี้ก่อนเลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ไม่มีใครที่ซื้อครบทุกอย่างในวันแรก ค่อย ๆ สะสมตามโปรเจกต์ที่ทำ สักวันหนึ่งมองย้อนกลับมาจะพบว่าโต๊ะทำงานเต็มไปด้วยเครื่องมือโดยไม่รู้ตัวเลย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 04:57:40.929+00	2026-06-03 20:23:17.192+00	published	2026-06-03 20:23:17.192+00
4	จากไฟฟ้าเปิด-ปิด สู่โค้ดภาษา C: คอมพิวเตอร์เข้าใจเราได้อย่างไร?	electricity-to-c-code	\N	คอมพิวเตอร์รู้จักแค่ไฟฟ้าเปิดกับปิด แล้วมันเข้าใจโค้ดที่เราพิมพ์ได้อย่างไร? บทความนี้พาไขความลับทีละชั้น จาก Machine Code สู่ภาษา C แบบที่คนไม่มีพื้นฐานก็เข้าใจได้	17	\N	Photo by <a href="https://unsplash.com/@thefreak1337?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Valentin Petkov</a> on <a href="https://unsplash.com/photos/green-and-black-circuit-board-mYY0c9WKKk8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a> 	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองนึกภาพตามนะครับ คุณพิมพ์โค้ดสั้นๆ ลงไปในคอมพิวเตอร์ กดปุ่มรัน แล้วไฟ LED ดวงเล็กๆ บนบอร์ดก็ติดขึ้นมา", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูเป็นเรื่องธรรมดา แต่ถ้าเราหยุดคิดสักนิด มันน่าทึ่งไม่น้อย เพราะสิ่งที่อยู่ตรงหน้าคุณคือก้อนซิลิคอนกับกระแสไฟฟ้า มันไม่รู้จักภาษาไทย ไม่รู้จักภาษาอังกฤษ ไม่รู้ด้วยซ้ำว่า \\"ตัวอักษร\\" คืออะไร แล้วมัน \\"เข้าใจ\\" คำสั่งที่เราพิมพ์ลงไปได้อย่างไร?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบสั้นๆ คือ คอมพิวเตอร์ไม่ได้เข้าใจภาษาของเราเลยแม้แต่น้อย สิ่งเดียวที่มันเข้าใจคือไฟฟ้า \\"เปิด\\" กับ \\"ปิด\\" เท่านั้น บทความนี้จะพาคุณไขความลับทีละขั้น ว่าจากแค่สองสถานะง่ายๆ นี้ มันค่อยๆ กลายมาเป็นโค้ดที่เราเขียนกันได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ทุกอย่างเริ่มจากไฟฟ้าสถานะเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลึกลงไปในชิปทุกตัว ไม่ว่าจะเป็นคอมพิวเตอร์ มือถือ หรือเครื่องซักผ้า แก่นแท้ของมันคือสวิตช์ไฟฟ้าจิ๋วจำนวนมหาศาล นับเป็นพันล้านตัว สวิตช์แต่ละตัวก็เหมือนสวิตช์ไฟในบ้านเรา คือมีแค่สองสถานะ — เปิด กับ ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เราแทน \\"เปิด\\" ด้วยเลข 1 และ \\"ปิด\\" ด้วยเลข 0 และเจ้าเลขสองตัวนี้เอง — 0 กับ 1 — คือภาษาเดียวที่คอมพิวเตอร์เข้าใจจริงๆ เราเรียกมันว่า", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "เลขฐานสอง (binary)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คุณอาจสงสัยว่า แค่ 0 กับ 1 จะสื่อความหมายอะไรได้ ลองนึกถึงการส่งสัญญาณด้วยไฟฉายตอนกลางคืนดูครับ ไฟดวงเดียวเปิด-ปิดได้แค่สองแบบ แต่ถ้าเรามีไฟหลายดวงเรียงกัน แล้วกำหนดว่าแต่ละรูปแบบการเปิด-ปิดหมายถึงอะไร เราก็ส่งข้อความที่ซับซ้อนได้ คอมพิวเตอร์ก็ใช้หลักการเดียวกันเป๊ะ เพียงแต่ทำได้เร็วและมีจำนวน \\"หลอดไฟ\\" มากกว่ามหาศาล", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Machine Code: ภาษาที่คอมพิวเตอร์เข้าใจ แต่มนุษย์ปวดหัว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เมื่อเราเอาเลข 0 กับ 1 มาเรียงต่อกันเป็นชุดตามกติกาที่กำหนดไว้ มันก็กลายเป็น \\"คำสั่ง\\" ที่สั่งให้ CPU ทำงานได้ ลองดูชุดเลขนี้ครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "10110000 01100001", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สำหรับเราอาจดูเหมือนเลขมั่วๆ แต่สำหรับ CPU แล้ว นี่คือคำสั่งที่ชัดเจนหนึ่งคำสั่ง ประมาณว่า \\"เอาค่านี้ไปเก็บไว้ตรงนี้\\" เราเรียกเลขฐานสองที่เป็นคำสั่งแบบนี้ว่า **Machine Code** หรือภาษาเครื่อง มันคือสิ่งที่ CPU อ่านแล้วลงมือทำได้ทันที ไม่ต้องแปลอะไรอีก", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ปัญหาคือ... ลองจินตนาการว่าคุณต้องเขียนโปรแกรมทั้งโปรแกรมด้วยเลข 0 กับ 1 แบบนี้ โปรแกรมจริงๆ มีคำสั่งเป็นแสนเป็นล้านบรรทัด ไม่มีมนุษย์คนไหนเขียนหรือจำไหว แค่พิมพ์ผิดไปตัวเดียวก็หาไม่เจอแล้ว นี่จึงเป็นจุดเริ่มต้นที่มนุษย์คิดค้น \\"ตัวช่วย\\" ขึ้นมาทีละชั้น เพื่อให้เขียนโปรแกรมได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA: เมนูคำสั่งประจำตัวของ CPU แต่ละรุ่น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ก่อนจะไปดูตัวช่วย มีอีกเรื่องที่ต้องเข้าใจก่อน นั่นคือ CPU แต่ละแบบไม่ได้เข้าใจเลขฐานสองเหมือนกันหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "เปรียบเหมือนร้านอาหารที่มีเมนูของตัวเอง ร้านหนึ่งสั่ง \\"เมนูเบอร์ 5\\" ได้ผัดกะเพรา อีกร้านสั่งเบอร์ 5 เดียวกันอาจได้ข้าวมันไก่ CPU ก็เช่นกัน เลขฐานสองชุดเดียวกันอาจหมายถึงคนละคำสั่งบน CPU คนละแบบ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "รายการคำสั่งทั้งหมดที่ CPU รุ่นหนึ่งๆ รองรับ — ว่าเลขชุดไหนหมายถึงคำสั่งอะไร มีที่เก็บข้อมูลชั่วคราว (register) อะไรบ้าง — เราเรียกรวมๆ ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "ISA (Instruction Set Architecture) ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "หรือก็คือ \\"เมนู\\" ประจำตัวของ CPU นั่นเอง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ISA ที่เราเจอในชีวิตจริงก็มีหลายแบบ เช่น ARM ที่อยู่ในมือถือและบอร์ด STM32, x86 ที่อยู่ในคอมพิวเตอร์และโน้ตบุ๊ก หรือ AVR ที่อยู่ในบอร์ด Arduino ยอดนิยม", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ประเด็นสำคัญที่ต้องจำคือ เพราะ CPU คนละ ISA มีเมนูคนละชุด โปรแกรม (machine code) ที่สร้างมาสำหรับชิปแบบหนึ่ง จึงเอาไปรันบนชิปอีกแบบไม่ได้ จำประเด็นนี้ไว้นะครับ เดี๋ยวมันจะกลับมาสำคัญมากตอนท้าย", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Assembly: แปลงเลขให้เป็นคำที่พอจำได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "วช่วยชั้นแรกที่มนุษย์คิดขึ้นมา คือการเอา \\"คำย่อ\\" มาแทนเลขฐานสองแต่ละคำสั่ง เพื่อให้พออ่านรู้เรื่องและจำได้ เราเรียกภาษาชั้นนี้ว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\"Assembly\\"", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ยกตัวอย่าง machine code ชุดเดิมที่เราเห็นไปก่อนหน้า เขียนเป็น Assembly ได้แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```asm", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "MOV AL, 61h    ; เอาค่า 0x61 ไปเก็บใน register ชื่อ AL", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "MOV", "type": "text", "style": "", "detail": 0, "format": 16, "version": 1}, {"mode": "normal", "text": " มาจากคำว่า move เห็นแบบนี้พออ่านออกแล้วว่ามันกำลัง \\"ย้าย\\" ค่าไปไหนสักที่ ดีกว่ามานั่งไล่อ่าน 10110000 01100001 เยอะเลย และที่สำคัญคือ Assembly หนึ่งบรรทัดนี้ แปลตรงกลับไปเป็น machine code ชุดที่เราเห็นตอนแรกได้พอดี", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 16}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ฟังดูดีขึ้นเยอะ แต่ Assembly ก็ยังมีจุดที่ไม่สะดวกอยู่สองข้อ ข้อแรกคือมันยังต้องสั่งงานทีละขั้นเล็กๆ อย่างละเอียด งานง่ายๆ ในหัวเราอาจต้องเขียน Assembly หลายบรรทัด ข้อสองคือ — จำเรื่อง ISA ที่บอกให้จำไว้ได้ไหมครับ — Assembly ก็ยังผูกติดกับ ISA ของชิปแต่ละแบบอยู่ดี Assembly ของ ARM กับของ x86 ก็เขียนคนละแบบ ถ้าเปลี่ยนชิปก็ต้องเขียนใหม่", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C: จุดที่ลงตัวที่สุด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วเราก็มาถึงพระเอกของเรา — ภาษา C ซึ่งเป็นตัวช่วยอีกชั้นที่ยกระดับขึ้นไปอีก ใกล้เคียงภาษามนุษย์มากขึ้น คำสั่ง Assembly ที่เราเห็นเมื่อกี้ เขียนเป็นภาษา C ได้สั้นๆ แบบนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```c", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "char al = 0x61", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "อ่านปุ๊บก็พอเดาออกว่า \\"เก็บค่า 0x61 ลงในตัวแปรชื่อ al\\" เราไม่ต้องไปยุ่งกับ register หรือจำเมนูของ ISA ให้ปวดหัวอีกต่อไป เราเขียนสิ่งที่เราอยากให้เกิดขึ้น แล้วมีโปรแกรมตัวหนึ่งที่เรียกว่า ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "คอมไพเลอร์ (compiler)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ทำหน้าที่แปลโค้ด C ของเราลงไปเป็น Assembly และ machine code ให้เองโดยอัตโนมัติ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แต่จุดที่ทำให้ C เจ๋งจริงๆ คือเรื่องนี้ครับ — โค้ด C ชุดเดียวกันนี้ เราเอาไปคอมไพล์สำหรับชิป ARM ก็ได้ x86 ก็ได้ AVR ก็ได้ แค่เปลี่ยนคอมไพเลอร์ให้ตรงกับชิป โดยไม่ต้องเขียนโค้ดใหม่ ต่างจาก Assembly ที่ต้องเขียนใหม่ทุกครั้งที่เปลี่ยนชิป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "นี่แหละคือเหตุผลที่ C ลงตัวที่สุดสำหรับงานที่ต้องคุมฮาร์ดแวร์ มันใกล้ชิดฮาร์ดแวร์พอที่จะสั่งงานได้ละเอียด แต่ก็ยังเขียนเป็นภาษาที่คนเข้าใจได้ และย้ายข้ามชิปได้ มันเลยกลายเป็นภาษาหลักของงานระบบฝังตัว (Embedded System) มาจนถึงทุกวันนี้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาพรวมทั้งหมด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ลองมาดูเส้นทางทั้งหมดในภาพเดียวกันครับ ว่าโค้ดที่เราเขียนเดินทางลงไปจนถึงไฟฟ้าจริงได้อย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สิ่งที่อยากให้จดจำจากภาพนี้คือ ยิ่งอยู่ชั้นบน มนุษย์ยิ่งเขียนง่าย แต่ก็ยิ่งห่างจากฮาร์ดแวร์ ส่วนยิ่งอยู่ชั้นล่าง ยิ่งคุมฮาร์ดแวร์ได้ละเอียด แต่ก็เขียนยากขึ้นเรื่อยๆ และไม่ว่าเราจะเขียนที่ชั้นไหน สุดท้ายทุกอย่างจะถูกแปลกลับลงมาเป็นไฟฟ้าเปิด-ปิดในวงจรจริงเสมอ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```markdown", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ภาษา C          char al = 0x61;          ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← มนุษย์เขียน อ่านง่าย ย้ายข้ามชิปได้", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (คอมไพเลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "  Assembly         MOV AL, 61h              ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "\\t", "type": "tab", "style": "", "detail": 2, "format": 0, "version": 1}, {"mode": "normal", "text": "← ผูกกับ ISA ของชิปแล้ว", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │  (แอสเซมเบลอร์แปลลงมา)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " Machine Code   10110000 01100001           ← CPU อ่านได้โดยตรง", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      │", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "      ▼", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "   Hardware      ⚡ ไฟฟ้าเปิด/ปิดในวงจรจริง   ← LED ติด, มอเตอร์หมุน", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "```", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "สรุป", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "กลับมาที่คำถามตอนต้น ว่าคอมพิวเตอร์ \\"เข้าใจ\\" คำสั่งของเราได้อย่างไร ทั้งที่มันรู้จักแค่ไฟฟ้าเปิด-ปิด", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "คำตอบก็คือ มันไม่ได้เข้าใจเราโดยตรงเลย แต่มีชั้นของการแปลภาษาซ้อนกันอยู่หลายชั้น ตั้งแต่ภาษา C ที่เราเขียน ถูกแปลลงเป็น Assembly แล้วเป็น Machine Code และสุดท้ายกลายเป็นไฟฟ้าที่ไหลในวงจร แต่ละชั้นทำหน้าที่แปลภาษาให้อีกชั้นที่อยู่ต่ำกว่าเข้าใจ มันไม่ใช่เวทมนตร์ แต่เป็นระบบที่มนุษย์ค่อยๆ สร้างขึ้นมาอย่างชาญฉลาด เพื่อให้เราคุยกับเครื่องจักรได้ง่ายขึ้น", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "และถ้าคุณอ่านมาถึงตรงนี้แล้วรู้สึกว่าอยากลองเขียนโค้ด C สั่งให้ฮาร์ดแวร์ทำงานด้วยตัวเองดูบ้าง — สั่งให้ LED ติด อ่านค่าจากเซ็นเซอร์ หรือควบคุมมอเตอร์ — นี่แหละคือโลกของการเขียนโปรแกรมระบบฝังตัว ที่คุณเริ่มต้นได้แม้ไม่มีพื้นฐานมาก่อน เพราะตอนนี้คุณเข้าใจภาพใหญ่ทั้งหมดแล้วว่าทุกอย่างเชื่อมโยงกันอย่างไร", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "แล้วพบกันในบทความถัดไปครับ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	2026-06-16 05:24:28.939+00	2026-06-16 05:13:40.891+00	published	2026-06-16 06:30:00+00
\.


--
-- Data for Name: posts_rels; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.posts_rels (id, "order", parent_id, path, categories_id, tags_id) FROM stdin;
41	1	3	categories	1	\N
42	1	3	tags	\N	4
43	2	3	tags	\N	5
44	3	3	tags	\N	1
45	1	2	categories	3	\N
46	1	2	tags	\N	3
47	1	1	categories	4	\N
48	1	1	tags	\N	1
49	2	1	tags	\N	2
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.projects (id, title, slug, sub_title, excerpt, feature_image_image_id, feature_image_caption, feature_image_credits, body, parts_used, updated_at, created_at, _status, published_at) FROM stdin;
\.


--
-- Data for Name: projects_rels; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.projects_rels (id, "order", parent_id, path, categories_id, tags_id) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.tags (id, title, updated_at, created_at) FROM stdin;
1	Hardware	2026-06-03 20:36:02.065+00	2026-06-03 20:35:35.001+00
2	Tools	2026-06-03 20:36:13.758+00	2026-06-03 20:35:47.991+00
3	Electronics	2026-06-04 05:46:54.298+00	2026-06-04 05:46:54.298+00
5	Maker	2026-06-04 06:11:29.181+00	2026-06-04 06:11:29.18+00
4	3D-Printing	2026-06-05 08:41:19.47+00	2026-06-04 06:11:12.973+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	2026-06-03 19:42:58.059+00	2026-06-03 19:42:58.058+00	athivvat@gmail.com	\N	\N	354a5bf097fe78229c5f1a46b1c2829d75b1a00377aa0ae459f84158ed825238	7e5a6f980fdadc7e9586b921bdc8ee2577c64fbcb98ec198363d17f3b42367b9ecae47cb06d522b22b21195fb5c8216eb450cac79bdfe1847f4a8712e30e47c1d7e91a1e56820140a4f096ffe121ce62308968f6b506dec68bbf0dd62444859a63c91afb3b0b5a4daa979c7f280da8c2879484d3f3501a02e6f1a79acb03c775cf1a8d7cdb6a2707ccaba4c606fcee304ddf9e34d58bae3adaa8dee4d025dda2a8b99bbc0ea89e1e2222fb6880c46ca130370859525c8bab6df5dc0302f5e483771bfbb53b2842e9cec4e47f8222b8c1dc7b24e29a26bab315d4da7ae4ae79cbf2b69c85c4b1f3129b6c6cb7bbbf049e39c8b7c95cbac1179c9cbddf6546d22ed168e95bbf9199d29b8529e6b2ae9eec0c68f7f4e9568d1c7f734a89ca354c37f7091a156f9090c62bccb152ab8b33748387a08beaa91937e1bc73608c50705336008557a6b3cf2a8803488cbeb37a1d3871a5932e1c1053fe61991b97cb6278310e02a24911e0552ee774678723d7dec762e20f9bc57c7988ad49915d46d00fb9883df3a3d9036005de3b687093a712f79ff768246369d7403938b6a95570eee95612a7f2ff99ecd04c77f6303ca83c8ccab0d919aebdd0fc692594b1e9617ea60f5f04a8960addb15ff560e6310ccf08671387fe6fc86b0aeb61e58a0a17a122bf398dbcfab2357904eb1c719924585d03780beb5fac56f30f880679896bc0	0	\N
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: cms; Owner: postgres
--

COPY cms.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	1	c21d6bd9-c684-491f-906b-a4e250971e61	2026-06-16 04:18:34.142+00	2026-06-16 06:18:34.142+00
\.


--
-- Data for Name: __drizzle_migrations; Type: TABLE DATA; Schema: drizzle; Owner: postgres
--

COPY drizzle.__drizzle_migrations (id, hash, created_at) FROM stdin;
1	cfde2a38b3dad1a624344b885262d39fe9937dff7a16db7a2bf54d43851bd38b	1780647443531
2	80be588cb63ca08ac1bb656b6d8e387f1f12eafb361118b9f7eaa25a3b62cf6c	1780651941796
3	901bcdcf6f7805d203dbef9639b5897f04534c51841243e9ade6e88d3a406c45	1780676020454
4	d7440b4c3cf82bb2d7478f6c4527f20ebd26e4c6ad76baf1e1c7ae0623c8a71a	1780836779240
\.


--
-- Data for Name: auth_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_account (id, account_id, provider_id, user_id, access_token, refresh_token, id_token, access_token_expires_at, refresh_token_expires_at, scope, password, created_at, updated_at) FROM stdin;
BooBdNHnePRKD44qhBmBEz0k9oFtxtxv	ebsnw9uwNRbOFQ2SjgS81hBuKVIYPn2P	credential	ebsnw9uwNRbOFQ2SjgS81hBuKVIYPn2P	\N	\N	\N	\N	\N	\N	44222e017aabdcc69e52b921451e0d04:964c32620e9bb98dc72da57bd218708a784a8b3e77445ecf0397816c86b5dc6525f8b9eff0abbc6cc4d04cd131b58390d4fbc5ce9db06ad75bd52b64f5ceba26	2026-06-07 15:42:56.417	2026-06-07 15:42:56.417
\.


--
-- Data for Name: auth_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_session (id, expires_at, token, created_at, updated_at, ip_address, user_agent, user_id) FROM stdin;
JIsHLCwWdmKl6BfcH4M5lmqBwtYqhVkC	2026-06-14 16:24:03.166	qfsqPtIi9fEZ3zE9BHLUrIWyMTwtCqyP	2026-06-07 16:24:03.166	2026-06-07 16:24:03.166	184.22.107.43	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	ebsnw9uwNRbOFQ2SjgS81hBuKVIYPn2P
qrD7E4B790tx6YQ6dmI8Ff12y2cUh2aQ	2026-06-22 12:23:36.531	pp1WsPq65PgbfrFqhDLqKLTIQvzNqw4c	2026-06-15 12:23:36.532	2026-06-15 12:23:36.532	184.22.252.243	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	ebsnw9uwNRbOFQ2SjgS81hBuKVIYPn2P
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, name, email, email_verified, image, created_at, updated_at) FROM stdin;
ebsnw9uwNRbOFQ2SjgS81hBuKVIYPn2P	Athiwat Hirunworawongkun	admin@machineslabs.co	f	\N	2026-06-07 15:42:56.18	2026-06-07 15:42:56.18
\.


--
-- Data for Name: auth_verification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_verification (id, identifier, value, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lms_certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lms_certificate (id, user_id, course_id, certificate_code, issued_at, metadata) FROM stdin;
\.


--
-- Data for Name: lms_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lms_courses (id, title, slug, summary, description, thumbnail_url, platform, udemy_url, price, published, created_at, updated_at, coming_soon, intended_learners, learning_objectives, requirements) FROM stdin;
course_keua0us	ภาษา C สำหรับระบบสมองกลฝังตัว (The C Language for Embedded Systems)	ภาษา-c-สำหรับระบบสมองกลฝังตัว-the-c-language-for-embedded-systems	เรียนรู้การเขียนภาษา C ตั้งแต่ศูนย์ จนสามารถนำไปควบคุมฮาร์ดแวร์ในงานระบบฝังตัวได้จริง ผ่านการลงมือทำบนไมโครคอนโทรลเลอร์ พร้อมโปรเจกต์สรุปท้ายคอร์ส	หลักสูตรนี้ออกแบบมาสำหรับผู้ที่ไม่มีพื้นฐานการเขียนโปรแกรมมาก่อน โดยจะพาผู้เรียนเดินทางจากความเข้าใจพื้นฐานที่สุด — ว่าคอมพิวเตอร์ทำงานด้วยไฟฟ้าเปิด/ปิดอย่างไร และโค้ดที่เราเขียนถูกแปลงไปสั่งฮาร์ดแวร์ได้อย่างไร — ไปจนถึงการเขียนโปรแกรมภาษา C เพื่อควบคุมไมโครคอนโทรลเลอร์ได้ด้วยตนเอง\n\nตลอดทั้งหลักสูตรผู้เรียนจะได้ปูพื้นฐานภาษา C อย่างเป็นระบบ เข้าใจแนวคิดสำคัญที่งาน Embedded ต้องใช้เป็นพิเศษ เช่น การจัดการหน่วยความจำ pointer และการจัดการบิต จากนั้นจึงต่อยอดสู่การทำความเข้าใจสถาปัตยกรรมของไมโครคอนโทรลเลอร์ การสั่งงาน register และ peripheral ต่างๆ เช่น GPIO, ADC, PWM, Timer และโปรโตคอลการสื่อสาร และปิดท้ายด้วยการสร้างโปรเจกต์ระบบฝังตัวที่ใช้งานได้จริง\n\nเนื้อหาเน้นการลงมือปฏิบัติควบคู่กับทฤษฎี ผู้เรียนจะได้ทดลองเขียนโค้ดและรันบนบอร์ดจริงหรือ simulator พร้อมแบบฝึกหัดทุกสัปดาห์ เพื่อให้มั่นใจว่าเข้าใจและประยุกต์ใช้ได้จริง เมื่อจบหลักสูตร ผู้เรียนจะมีพื้นฐานที่แข็งแรงพอที่จะพัฒนาโปรเจกต์ Embedded ของตนเอง และศึกษาต่อในระดับที่สูงขึ้นได้	https://pub-5fff2c1eb8574b209edc97a94354c937.r2.dev/uploads/assets/1780847498255_kafe8b9.webp	udemy	https://udemy.com	599	t	2026-06-07 15:47:34.00336+00	2026-06-15 12:41:32.633+00	t	["นักเรียนและนักศึกษาสาขาวิศวกรรมไฟฟ้า อิเล็กทรอนิกส์ คอมพิวเตอร์ เมคคาทรอนิกส์ หรือสาขาที่เกี่ยวข้อง", "ผู้ที่สนใจเริ่มต้นเรียนรู้การเขียนโปรแกรมสำหรับระบบสมองกลฝังตัว", "ผู้ที่เคยเขียนโปรแกรมบนคอมพิวเตอร์มาบ้าง และต้องการต่อยอดสู่งานที่ทำงานร่วมกับฮาร์ดแวร์", "ผู้ที่เล่น Arduino, STM32, PIC หรือไมโครคอนโทรลเลอร์อื่น ๆ อยู่แล้ว และอยากเขียนโค้ดให้มีโครงสร้างและเป็นระบบมากขึ้น", "ผู้สนใจทั่วไปที่อยากเข้าใจหลักการเบื้องหลังการทำงานของอุปกรณ์อัจฉริยะรอบตัว"]	["เข้าใจภาพรวมว่าคอมพิวเตอร์ทำงานอย่างไร ตั้งแต่ Machine Code, ISA, Assembly จนถึงภาษา C และเหตุผลที่ C เหมาะกับงาน Embedded", "เขียนโปรแกรมภาษา C ได้ตั้งแต่พื้นฐาน ทั้งตัวแปร เงื่อนไข ลูป ฟังก์ชัน และการจัดระเบียบโค้ด", "เข้าใจและใช้งาน pointer การจัดการหน่วยความจำ และการเข้าถึง address โดยตรง", "ใช้เทคนิคการจัดการบิต (bit manipulation) เพื่อควบคุม register ของฮาร์ดแวร์", "เข้าใจสถาปัตยกรรมไมโครคอนโทรลเลอร์ และอ่าน datasheet เบื้องต้นได้", "ควบคุม peripheral ได้จริง เช่น GPIO, ADC, PWM, Timer และ Interrupt", "สื่อสารระหว่างอุปกรณ์ด้วยโปรโตคอล UART, I2C และ SPI เบื้องต้น", "ดีบักโปรแกรมและแก้ปัญหาบนฮาร์ดแวร์จริงได้", "สร้างโปรเจกต์ระบบฝังตัวที่ใช้งานได้จริงตั้งแต่ต้นจนจบ"]	["มีพื้นฐานการเขียนโปรแกรมมาบ้าง (ภาษาใดก็ได้ เช่น C, Python, Java) เข้าใจแนวคิดตัวแปร เงื่อนไข และลูป", "ไม่จำเป็นต้องมีประสบการณ์ด้านระบบสมองกลฝังตัวมาก่อน เพราะหลักสูตรเริ่มสอนจากพื้นฐาน", "มีความเข้าใจวงจรอิเล็กทรอนิกส์ขั้นพื้นฐานจะช่วยให้เรียนได้ราบรื่นขึ้น แต่ไม่บังคับ", "มีคอมพิวเตอร์สำหรับติดตั้งเครื่องมือพัฒนา (รายละเอียดการติดตั้งอยู่ใน Module บทนำ)", "มีความสนใจและพร้อมลงมือฝึกเขียนโค้ดตามไปด้วยระหว่างเรียน"]
\.


--
-- Data for Name: lms_enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lms_enrollment (id, user_id, course_id, status, progress, enrolled_at, completed_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lms_lesson_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lms_lesson_progress (id, user_id, course_id, lesson_id, completed, completed_at, last_accessed_at) FROM stdin;
\.


--
-- Data for Name: lms_lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lms_lessons (id, course_id, module_id, title, slug, type, content, video_url, duration, is_free_preview, "order", created_at, updated_at) FROM stdin;
lesson_v7c42vf	course_keua0us	module_2ml2xbd	แนะนำเนื้อหาหลักสูตร	แนะนำเนื้อหาหลักสูตร	video	ทำความรู้จักระบบฝังตัว ตัวอย่างในชีวิตประจำวัน และความแตกต่างระหว่างไมโครคอนโทรลเลอร์กับคอมพิวเตอร์ทั่วไป	\N	10	t	1	2026-06-15 12:32:00.08184+00	2026-06-15 12:34:19.491+00
lesson_t3vdp7u	course_keua0us	module_2ml2xbd	จาก Machine Code สู่ภาษา C	จาก-machine-code-สู่ภาษา-c	video	ทำความเข้าใจชั้นการทำงาน 4 ระดับ ได้แก่ Machine Code, ISA (Instruction Set Architecture), Assembly และภาษา C ว่าแต่ละชั้นเชื่อมโยงกันอย่างไร	\N	10	t	2	2026-06-15 12:32:26.67399+00	2026-06-15 12:34:28.934+00
lesson_phexlqr	course_keua0us	module_2ml2xbd	โค้ด C ไปควบคุมฮาร์ดแวร์ได้อย่างไร	โค้ด-c-ไปควบคุมฮาร์ดแวร์ได้อย่างไร	video	ติดตามเส้นทางจาก main.c ผ่านการคอมไพล์เป็น binary จนถึง CPU ทำงานและจ่ายไฟออกที่ขาชิปจริง	\N	10	t	3	2026-06-15 12:32:54.917431+00	2026-06-15 12:34:36.557+00
lesson_bh8wcl8	course_keua0us	module_2ml2xbd	ทำไมต้องเป็นภาษา C	ทำไมต้องเป็นภาษา-c	video	เปรียบเทียบ C กับภาษาอื่น ในแง่การเข้าถึงฮาร์ดแวร์ ขนาด ความเร็ว และความสามารถในการย้ายข้ามชิป\n	\N	10	f	4	2026-06-15 12:33:14.682945+00	2026-06-15 12:34:42.065+00
lesson_aecrjoc	course_keua0us	module_2ml2xbd	ติดตั้งเครื่องมือและเขียนโปรแกรมแรก	ติดตั้งเครื่องมือและเขียนโปรแกรมแรก	video	ติดตั้ง compiler, IDE และทดลองเขียน รวมถึงรันโปรแกรม C โปรแกรมแรก\n	\N	10	f	5	2026-06-15 12:35:27.147488+00	2026-06-15 12:35:27.147488+00
lesson_ljuvkn6	course_keua0us	module_f3oqf2y	ตัวแปรและชนิดข้อมูล	ตัวแปรและชนิดข้อมูล	video	โครงสร้างโปรแกรม C, ฟังก์ชัน main, ตัวแปร, ชนิดข้อมูล (int, char, float) และการแสดงผล\n	\N	10	f	1	2026-06-15 12:36:40.068908+00	2026-06-15 12:36:40.068908+00
lesson_z7uzi2i	course_keua0us	module_f3oqf2y	ตัวดำเนินการและการควบคุมเงื่อนไข	ตัวดำเนินการและการควบคุมเงื่อนไข	video	ตัวดำเนินการทางคณิตศาสตร์/ตรรกะ/เปรียบเทียบ และคำสั่งเงื่อนไข if/else, switch\n	\N	10	f	2	2026-06-15 12:36:48.72667+00	2026-06-15 12:36:48.72667+00
lesson_eo6zgy7	course_keua0us	module_f3oqf2y	การวนซ้ำ (Loop)	การวนซ้ำ-loop	video	ลูป for, while, do-while และการประยุกต์ใช้ในงานควบคุม เช่น การทำงานซ้ำต่อเนื่อง\n	\N	10	f	3	2026-06-15 12:36:56.753376+00	2026-06-15 12:36:56.753376+00
lesson_var0ah6	course_keua0us	module_f3oqf2y	ฟังก์ชัน (function)	ฟังก์ชัน-function	video	การสร้างและเรียกใช้ฟังก์ชัน, parameter, return value และขอบเขตของตัวแปร (scope)\n	\N	10	f	4	2026-06-15 12:37:11.046251+00	2026-06-15 12:37:11.046251+00
lesson_ainyo7e	course_keua0us	module_f3oqf2y	Array และ String	array-และ-string	video	การใช้งานอาเรย์ การจัดการสตริง และการแบ่งโค้ดออกเป็นหลายไฟล์	\N	10	f	4	2026-06-15 12:37:19.799019+00	2026-06-15 12:37:19.799019+00
lesson_z6vvwhz	course_keua0us	module_6n2spps	Pointer และ Address	pointer-และ-address	video	ความเข้าใจเรื่อง pointer การอ้างอิงและการเข้าถึงค่าผ่าน address และความสัมพันธ์กับอาเรย์	\N	10	f	1	2026-06-15 12:37:54.64182+00	2026-06-15 12:37:54.64182+00
lesson_5ringia	course_keua0us	module_6n2spps	การจัดการหน่วยความจำ	การจัดการหน่วยความจำ	video	ความแตกต่างระหว่าง Stack และ Heap ข้อจำกัดของหน่วยความจำในไมโครคอนโทรลเลอร์\n	\N	10	f	1	2026-06-15 12:38:02.667247+00	2026-06-15 12:38:02.667247+00
lesson_4k14zb8	course_keua0us	module_6n2spps	การจัดการบิต (Bit Manipulation)	การจัดการบิต-bit-manipulation	video	ตัวดำเนินการระดับบิต และเทคนิค set/clear/toggle/check บิต เพื่อควบคุม register	\N	10	f	2	2026-06-15 12:38:25.988697+00	2026-06-15 12:38:25.988697+00
lesson_bmsjubb	course_keua0us	module_6n2spps	Struct, Union และ Enum	struct-union-และ-enum	video	การจัดกลุ่มข้อมูล และการใช้ typedef เพื่อให้โค้ดอ่านง่ายและจัดการง่ายขึ้น	\N	10	f	3	2026-06-15 12:38:56.179434+00	2026-06-15 12:38:56.179434+00
lesson_e7qbr2q	course_keua0us	module_6n2spps	Qualifier สำคัญใน Embedded	qualifier-สำคัญใน-embedded	video	ความหมายและการใช้ volatile, const, static และเหตุผลที่งาน Embedded ต้องใช้	\N	10	f	3	2026-06-15 12:39:05.122049+00	2026-06-15 12:39:05.122049+00
lesson_i681lqc	course_keua0us	module_dbttodb	สถาปัตยกรรมไมโครคอนโทรลเลอร์	สถาปัตยกรรมไมโครคอนโทรลเลอร์	video	ส่วนประกอบของ MCU ได้แก่ CPU, RAM, Flash, clock และแนวคิด memory-mapped I/O รวมถึงการอ่าน datasheet เบื้องต้น\n	\N	10	f	1	2026-06-15 12:39:51.620652+00	2026-06-15 12:39:51.620652+00
lesson_ii72itb	course_keua0us	module_dbttodb	GPIO: ควบคุมขาสัญญาณดิจิทัล	gpio-ควบคุมขาสัญญาณดิจิทัล	video	การควบคุมไฟ LED และการอ่านค่าจากปุ่มกด\n	\N	10	f	2	2026-06-15 12:40:02.914449+00	2026-06-15 12:40:02.914449+00
lesson_8049pq1	course_keua0us	module_dbttodb	ADC และ PWM	adc-และ-pwm	video	การอ่านค่าสัญญาณแอนะล็อกจากเซ็นเซอร์ และการสร้างสัญญาณ PWM เพื่อควบคุมความสว่างหรือมอเตอร์\n	\N	10	f	3	2026-06-15 12:40:12.101926+00	2026-06-15 12:40:12.101926+00
lesson_ma7ycvx	course_keua0us	module_dbttodb	Interrupt และ Timer	interrupt-และ-timer	video	ความแตกต่างระหว่าง Polling กับ Interrupt, การเขียน ISR และการใช้งาน Timer/Counter	\N	10	f	4	2026-06-15 12:40:20.436375+00	2026-06-15 12:40:20.436375+00
lesson_3p0823f	course_keua0us	module_dbttodb	การสื่อสารระหว่างอุปกรณ์	การสื่อสารระหว่างอุปกรณ์	video	พื้นฐานโปรโตคอล UART, I2C และ SPI สำหรับเชื่อมต่อกับอุปกรณ์ภายนอก	\N	10	f	5	2026-06-15 12:40:30.197578+00	2026-06-15 12:40:30.197578+00
lesson_0b9ax5a	course_keua0us	module_wztouti	เทคนิคการดีบักและแก้ปัญหา	เทคนิคการดีบักและแก้ปัญหา	video	การใช้ debugger และเครื่องมือวัด เพื่อหาและแก้ไขข้อผิดพลาดบนฮาร์ดแวร์จริง\n	\N	10	f	1	2026-06-15 12:41:53.132274+00	2026-06-15 12:41:53.132274+00
lesson_fr0lcs5	course_keua0us	module_wztouti	การออกแบบโปรแกรมด้วย State Machine	การออกแบบโปรแกรมด้วย-state-machine	video	แนวคิด state machine และการจัดการการทำงานหลายสถานะอย่างเป็นระบบ	\N	10	f	2	2026-06-15 12:42:05.009478+00	2026-06-15 12:42:05.009478+00
lesson_4f9zwnd	course_keua0us	module_wztouti	แนวคิด Real-time และการจัดการพลังงาน	แนวคิด-real-time-และการจัดการพลังงาน	video	พื้นฐานการตอบสนองตรงเวลา และเทคนิคประหยัดพลังงานในระบบฝังตัว\n	\N	10	f	3	2026-06-15 12:42:13.888006+00	2026-06-15 12:42:13.888006+00
lesson_wmm8j13	course_keua0us	module_wztouti	Capstone Project	capstone-project	video	ลงมือสร้างโปรเจกต์สรุปท้ายคอร์สตั้งแต่ออกแบบจนใช้งานได้ (เลือก 1 หัวข้อ เช่น ระบบรดน้ำต้นไม้อัตโนมัติ, สถานีวัดอุณหภูมิแสดงผลบนจอ LCD หรือระบบล็อกประตูด้วยรหัส)	\N	10	f	4	2026-06-15 12:42:23.844459+00	2026-06-15 12:42:23.844459+00
\.


--
-- Data for Name: lms_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lms_modules (id, course_id, title, description, "order", created_at, updated_at) FROM stdin;
module_f3oqf2y	course_keua0us	พื้นฐานภาษา C	ให้ผู้เรียนเขียนโปรแกรมภาษา C พื้นฐานได้ด้วยตนเอง เข้าใจโครงสร้างของโปรแกรม การควบคุมการทำงาน และการแบ่งโค้ดออกเป็นส่วนย่อยที่จัดการได้	2	2026-06-15 12:35:53.614164+00	2026-06-15 12:35:53.614164+00
module_2ml2xbd	course_keua0us	ปูพื้นฐานและความเข้าใจภาพรวม	ให้ผู้เรียนเห็นภาพรวมว่าคอมพิวเตอร์ทำงานด้วยอะไร โค้ดที่เราเขียนถูกแปลงไปควบคุมฮาร์ดแวร์ได้อย่างไร และเข้าใจเหตุผลว่าทำไมภาษา C จึงเป็นภาษาหลักของงาน Embedded เพื่อสร้างแรงจูงใจและพื้นฐานความเข้าใจที่ถูกต้องก่อนลงมือเขียนโค้ด	1	2026-06-15 12:29:01.78383+00	2026-06-15 12:36:03.912+00
module_6n2spps	course_keua0us	ภาษา C เชิงลึกสำหรับงาน Embedded	ให้ผู้เรียนเข้าใจแนวคิดของภาษา C ที่เป็นหัวใจสำคัญของงาน Embedded โดยเฉพาะการจัดการหน่วยความจำ pointer และการจัดการบิต ซึ่งเป็นกุญแจสำคัญในการควบคุมฮาร์ดแวร์โดยตรง	3	2026-06-15 12:37:39.246687+00	2026-06-15 12:37:39.246687+00
module_dbttodb	course_keua0us	สถาปัตยกรรมและการควบคุมฮาร์ดแวร์ 	ให้ผู้เรียนเข้าใจการทำงานภายในของไมโครคอนโทรลเลอร์ และสามารถเขียนโค้ด C เพื่อสั่งงาน peripheral ต่างๆ บนบอร์ดจริงได้	4	2026-06-15 12:39:23.69513+00	2026-06-15 12:39:23.69513+00
module_wztouti	course_keua0us	การปฏิบัติจริงและโปรเจกต์	ให้ผู้เรียนนำความรู้ทั้งหมดมาบูรณาการ ฝึกทักษะการดีบักและแก้ปัญหาแบบมืออาชีพ และสร้างโปรเจกต์ระบบฝังตัวที่สมบูรณ์ได้ด้วยตนเอง	5	2026-06-15 12:41:02.311132+00	2026-06-15 12:41:02.311132+00
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_product (id, name, slug, price, sku, image, description, category, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-06-03 18:26:49
20211116045059	2026-06-03 18:26:49
20211116050929	2026-06-03 18:26:49
20211116051442	2026-06-03 18:26:49
20211116212300	2026-06-03 18:26:49
20211116213355	2026-06-03 18:26:49
20211116213934	2026-06-03 18:26:49
20211116214523	2026-06-03 18:26:49
20211122062447	2026-06-03 18:26:49
20211124070109	2026-06-03 18:26:49
20211202204204	2026-06-03 18:26:49
20211202204605	2026-06-03 18:26:49
20211210212804	2026-06-03 18:26:49
20211228014915	2026-06-03 18:26:49
20220107221237	2026-06-03 18:26:49
20220228202821	2026-06-03 18:26:49
20220312004840	2026-06-03 18:26:49
20220603231003	2026-06-03 18:26:49
20220603232444	2026-06-03 18:26:49
20220615214548	2026-06-03 18:26:49
20220712093339	2026-06-03 18:26:49
20220908172859	2026-06-03 18:26:49
20220916233421	2026-06-03 18:26:49
20230119133233	2026-06-03 18:26:49
20230128025114	2026-06-03 18:26:49
20230128025212	2026-06-03 18:26:49
20230227211149	2026-06-03 18:26:49
20230228184745	2026-06-03 18:26:50
20230308225145	2026-06-03 18:26:50
20230328144023	2026-06-03 18:26:50
20231018144023	2026-06-03 18:26:50
20231204144023	2026-06-03 18:26:50
20231204144024	2026-06-03 18:26:50
20231204144025	2026-06-03 18:26:50
20240108234812	2026-06-03 18:26:50
20240109165339	2026-06-03 18:26:50
20240227174441	2026-06-03 18:26:50
20240311171622	2026-06-03 18:26:50
20240321100241	2026-06-03 18:26:50
20240401105812	2026-06-03 18:26:50
20240418121054	2026-06-03 18:26:50
20240523004032	2026-06-03 18:26:50
20240618124746	2026-06-03 18:26:50
20240801235015	2026-06-03 18:26:50
20240805133720	2026-06-03 18:26:50
20240827160934	2026-06-03 18:26:50
20240919163303	2026-06-03 18:26:50
20240919163305	2026-06-03 18:26:50
20241019105805	2026-06-03 18:26:50
20241030150047	2026-06-03 18:26:50
20241108114728	2026-06-03 18:26:50
20241121104152	2026-06-03 18:26:50
20241130184212	2026-06-03 18:26:50
20241220035512	2026-06-03 18:26:50
20241220123912	2026-06-03 18:26:50
20241224161212	2026-06-03 18:26:50
20250107150512	2026-06-03 18:26:50
20250110162412	2026-06-03 18:26:50
20250123174212	2026-06-03 18:26:50
20250128220012	2026-06-03 18:26:50
20250506224012	2026-06-03 18:26:50
20250523164012	2026-06-03 18:26:50
20250714121412	2026-06-03 18:26:50
20250905041441	2026-06-03 18:26:50
20251103001201	2026-06-03 18:26:50
20251120212548	2026-06-03 18:26:50
20251120215549	2026-06-03 18:26:50
20260218120000	2026-06-03 18:26:50
20260326120000	2026-06-03 18:26:50
20260514120000	2026-06-03 18:26:50
20260527120000	2026-06-03 18:26:50
20260528120000	2026-06-03 18:26:50
20260603120000	2026-06-04 04:22:12
20260605120000	2026-06-16 04:50:59
20260606110000	2026-06-16 04:50:59
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter, selected_columns) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-06-03 18:20:28.595892
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-06-03 18:20:28.607096
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-06-03 18:20:28.613441
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-06-03 18:20:28.627073
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-06-03 18:20:28.635194
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-06-03 18:20:28.640402
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-06-03 18:20:28.645266
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-06-03 18:20:28.650358
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-06-03 18:20:28.654693
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-06-03 18:20:28.659505
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-06-03 18:20:28.663861
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-06-03 18:20:28.66867
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-06-03 18:20:28.67367
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-06-03 18:20:28.678066
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-06-03 18:20:28.68251
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-06-03 18:20:28.699912
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-06-03 18:20:28.704396
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-06-03 18:20:28.709303
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-06-03 18:20:28.713539
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-06-03 18:20:28.719183
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-06-03 18:20:28.724541
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-06-03 18:20:28.729945
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-06-03 18:20:28.741078
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-06-03 18:20:28.75087
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-06-03 18:20:28.75559
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-06-03 18:20:28.760504
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-06-03 18:20:28.765528
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-06-03 18:20:28.770345
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-06-03 18:20:28.774175
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-06-03 18:20:28.779049
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-06-03 18:20:28.783209
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-06-03 18:20:28.787242
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-06-03 18:20:28.791112
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-06-03 18:20:28.795174
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-06-03 18:20:28.799615
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-06-03 18:20:28.804454
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-06-03 18:20:28.809183
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-06-03 18:20:28.813138
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-06-03 18:20:28.818356
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-06-03 18:20:28.826327
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-06-03 18:20:28.83073
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-06-03 18:20:28.834536
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-06-03 18:20:28.838642
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-06-03 18:20:28.842626
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-06-03 18:20:28.84654
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-06-03 18:20:28.851054
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-06-03 18:20:28.862555
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-06-03 18:20:28.867344
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-06-03 18:20:28.872061
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-06-03 18:20:28.886354
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-06-03 18:20:28.891951
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-06-03 18:20:28.922055
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-06-03 18:20:28.923616
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-06-03 18:20:28.932653
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-06-03 18:20:28.93543
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-06-03 18:20:28.937041
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-06-03 18:20:28.942431
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-06-03 18:20:28.948465
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-06-03 18:20:28.953215
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-06-03 18:20:28.95911
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-06-03 18:20:28.964149
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: _posts_v_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms._posts_v_id_seq', 7, true);


--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms._posts_v_rels_id_seq', 9, true);


--
-- Name: _projects_v_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms._projects_v_id_seq', 1, false);


--
-- Name: _projects_v_rels_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms._projects_v_rels_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.categories_id_seq', 9, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.media_id_seq', 17, true);


--
-- Name: payload_jobs_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_jobs_id_seq', 1, false);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_kv_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_locked_documents_id_seq', 19, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_locked_documents_rels_id_seq', 38, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_migrations_id_seq', 6, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_preferences_id_seq', 7, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.payload_preferences_rels_id_seq', 11, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.posts_id_seq', 4, true);


--
-- Name: posts_rels_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.posts_rels_id_seq', 49, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.projects_id_seq', 1, false);


--
-- Name: projects_rels_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.projects_rels_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.tags_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: cms; Owner: postgres
--

SELECT pg_catalog.setval('cms.users_id_seq', 1, true);


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE SET; Schema: drizzle; Owner: postgres
--

SELECT pg_catalog.setval('drizzle.__drizzle_migrations_id_seq', 4, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: _posts_v _posts_v_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v
    ADD CONSTRAINT _posts_v_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_rels _posts_v_rels_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _projects_v _projects_v_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v
    ADD CONSTRAINT _projects_v_pkey PRIMARY KEY (id);


--
-- Name: _projects_v_rels _projects_v_rels_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v_rels
    ADD CONSTRAINT _projects_v_rels_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs_log payload_jobs_log_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs payload_jobs_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_jobs
    ADD CONSTRAINT payload_jobs_pkey PRIMARY KEY (id);


--
-- Name: payload_kv payload_kv_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_kv
    ADD CONSTRAINT payload_kv_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_rels posts_rels_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts_rels
    ADD CONSTRAINT posts_rels_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects_rels projects_rels_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects_rels
    ADD CONSTRAINT projects_rels_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: __drizzle_migrations __drizzle_migrations_pkey; Type: CONSTRAINT; Schema: drizzle; Owner: postgres
--

ALTER TABLE ONLY drizzle.__drizzle_migrations
    ADD CONSTRAINT __drizzle_migrations_pkey PRIMARY KEY (id);


--
-- Name: auth_account auth_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_account
    ADD CONSTRAINT auth_account_pkey PRIMARY KEY (id);


--
-- Name: auth_session auth_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_session
    ADD CONSTRAINT auth_session_pkey PRIMARY KEY (id);


--
-- Name: auth_session auth_session_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_session
    ADD CONSTRAINT auth_session_token_unique UNIQUE (token);


--
-- Name: auth_user auth_user_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_email_unique UNIQUE (email);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_verification auth_verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_verification
    ADD CONSTRAINT auth_verification_pkey PRIMARY KEY (id);


--
-- Name: lms_certificate lms_certificate_certificate_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_certificate
    ADD CONSTRAINT lms_certificate_certificate_code_unique UNIQUE (certificate_code);


--
-- Name: lms_certificate lms_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_certificate
    ADD CONSTRAINT lms_certificate_pkey PRIMARY KEY (id);


--
-- Name: lms_courses lms_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_courses
    ADD CONSTRAINT lms_courses_pkey PRIMARY KEY (id);


--
-- Name: lms_courses lms_courses_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_courses
    ADD CONSTRAINT lms_courses_slug_unique UNIQUE (slug);


--
-- Name: lms_enrollment lms_enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_enrollment
    ADD CONSTRAINT lms_enrollment_pkey PRIMARY KEY (id);


--
-- Name: lms_lesson_progress lms_lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_lesson_progress
    ADD CONSTRAINT lms_lesson_progress_pkey PRIMARY KEY (id);


--
-- Name: lms_lessons lms_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_lessons
    ADD CONSTRAINT lms_lessons_pkey PRIMARY KEY (id);


--
-- Name: lms_modules lms_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_modules
    ADD CONSTRAINT lms_modules_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_slug_unique UNIQUE (slug);


--
-- Name: messages messages_payload_exclusive; Type: CHECK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages
    ADD CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL))) NOT VALID;


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: idx_users_created_at_desc; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_created_at_desc ON auth.users USING btree (created_at DESC);


--
-- Name: idx_users_email; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_email ON auth.users USING btree (email);


--
-- Name: idx_users_last_sign_in_at_desc; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_last_sign_in_at_desc ON auth.users USING btree (last_sign_in_at DESC);


--
-- Name: idx_users_name; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_users_name ON auth.users USING btree (((raw_user_meta_data ->> 'name'::text))) WHERE ((raw_user_meta_data ->> 'name'::text) IS NOT NULL);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: _posts_v_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_created_at_idx ON cms._posts_v USING btree (created_at);


--
-- Name: _posts_v_latest_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_latest_idx ON cms._posts_v USING btree (latest);


--
-- Name: _posts_v_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_parent_idx ON cms._posts_v USING btree (parent_id);


--
-- Name: _posts_v_rels_categories_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_rels_categories_id_idx ON cms._posts_v_rels USING btree (categories_id);


--
-- Name: _posts_v_rels_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_rels_order_idx ON cms._posts_v_rels USING btree ("order");


--
-- Name: _posts_v_rels_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_rels_parent_idx ON cms._posts_v_rels USING btree (parent_id);


--
-- Name: _posts_v_rels_path_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_rels_path_idx ON cms._posts_v_rels USING btree (path);


--
-- Name: _posts_v_rels_tags_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_rels_tags_id_idx ON cms._posts_v_rels USING btree (tags_id);


--
-- Name: _posts_v_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_updated_at_idx ON cms._posts_v USING btree (updated_at);


--
-- Name: _posts_v_version_feature_image_version_feature_image_ima_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_version_feature_image_version_feature_image_ima_idx ON cms._posts_v USING btree (version_feature_image_image_id);


--
-- Name: _posts_v_version_version__status_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_version_version__status_idx ON cms._posts_v USING btree (version__status);


--
-- Name: _posts_v_version_version_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_version_version_created_at_idx ON cms._posts_v USING btree (version_created_at);


--
-- Name: _posts_v_version_version_slug_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_version_version_slug_idx ON cms._posts_v USING btree (version_slug);


--
-- Name: _posts_v_version_version_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _posts_v_version_version_updated_at_idx ON cms._posts_v USING btree (version_updated_at);


--
-- Name: _projects_v_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_created_at_idx ON cms._projects_v USING btree (created_at);


--
-- Name: _projects_v_latest_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_latest_idx ON cms._projects_v USING btree (latest);


--
-- Name: _projects_v_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_parent_idx ON cms._projects_v USING btree (parent_id);


--
-- Name: _projects_v_rels_categories_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_rels_categories_id_idx ON cms._projects_v_rels USING btree (categories_id);


--
-- Name: _projects_v_rels_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_rels_order_idx ON cms._projects_v_rels USING btree ("order");


--
-- Name: _projects_v_rels_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_rels_parent_idx ON cms._projects_v_rels USING btree (parent_id);


--
-- Name: _projects_v_rels_path_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_rels_path_idx ON cms._projects_v_rels USING btree (path);


--
-- Name: _projects_v_rels_tags_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_rels_tags_id_idx ON cms._projects_v_rels USING btree (tags_id);


--
-- Name: _projects_v_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_updated_at_idx ON cms._projects_v USING btree (updated_at);


--
-- Name: _projects_v_version_feature_image_version_feature_image__idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_version_feature_image_version_feature_image__idx ON cms._projects_v USING btree (version_feature_image_image_id);


--
-- Name: _projects_v_version_version__status_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_version_version__status_idx ON cms._projects_v USING btree (version__status);


--
-- Name: _projects_v_version_version_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_version_version_created_at_idx ON cms._projects_v USING btree (version_created_at);


--
-- Name: _projects_v_version_version_slug_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_version_version_slug_idx ON cms._projects_v USING btree (version_slug);


--
-- Name: _projects_v_version_version_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX _projects_v_version_version_updated_at_idx ON cms._projects_v USING btree (version_updated_at);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX categories_created_at_idx ON cms.categories USING btree (created_at);


--
-- Name: categories_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX categories_updated_at_idx ON cms.categories USING btree (updated_at);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX media_created_at_idx ON cms.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE UNIQUE INDEX media_filename_idx ON cms.media USING btree (filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX media_updated_at_idx ON cms.media USING btree (updated_at);


--
-- Name: payload_jobs_completed_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_completed_at_idx ON cms.payload_jobs USING btree (completed_at);


--
-- Name: payload_jobs_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_created_at_idx ON cms.payload_jobs USING btree (created_at);


--
-- Name: payload_jobs_has_error_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_has_error_idx ON cms.payload_jobs USING btree (has_error);


--
-- Name: payload_jobs_log_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_log_order_idx ON cms.payload_jobs_log USING btree (_order);


--
-- Name: payload_jobs_log_parent_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_log_parent_id_idx ON cms.payload_jobs_log USING btree (_parent_id);


--
-- Name: payload_jobs_processing_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_processing_idx ON cms.payload_jobs USING btree (processing);


--
-- Name: payload_jobs_queue_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_queue_idx ON cms.payload_jobs USING btree (queue);


--
-- Name: payload_jobs_task_slug_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_task_slug_idx ON cms.payload_jobs USING btree (task_slug);


--
-- Name: payload_jobs_total_tried_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_total_tried_idx ON cms.payload_jobs USING btree (total_tried);


--
-- Name: payload_jobs_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_updated_at_idx ON cms.payload_jobs USING btree (updated_at);


--
-- Name: payload_jobs_wait_until_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_jobs_wait_until_idx ON cms.payload_jobs USING btree (wait_until);


--
-- Name: payload_kv_key_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE UNIQUE INDEX payload_kv_key_idx ON cms.payload_kv USING btree (key);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_created_at_idx ON cms.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_global_slug_idx ON cms.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_categories_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_categories_id_idx ON cms.payload_locked_documents_rels USING btree (categories_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON cms.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_order_idx ON cms.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON cms.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_path_idx ON cms.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_posts_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_posts_id_idx ON cms.payload_locked_documents_rels USING btree (posts_id);


--
-- Name: payload_locked_documents_rels_projects_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_projects_id_idx ON cms.payload_locked_documents_rels USING btree (projects_id);


--
-- Name: payload_locked_documents_rels_tags_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_tags_id_idx ON cms.payload_locked_documents_rels USING btree (tags_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON cms.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_locked_documents_updated_at_idx ON cms.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_migrations_created_at_idx ON cms.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_migrations_updated_at_idx ON cms.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_created_at_idx ON cms.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_key_idx ON cms.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_rels_order_idx ON cms.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_rels_parent_idx ON cms.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_rels_path_idx ON cms.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_rels_users_id_idx ON cms.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX payload_preferences_updated_at_idx ON cms.payload_preferences USING btree (updated_at);


--
-- Name: posts__status_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts__status_idx ON cms.posts USING btree (_status);


--
-- Name: posts_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_created_at_idx ON cms.posts USING btree (created_at);


--
-- Name: posts_feature_image_feature_image_image_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_feature_image_feature_image_image_idx ON cms.posts USING btree (feature_image_image_id);


--
-- Name: posts_rels_categories_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_rels_categories_id_idx ON cms.posts_rels USING btree (categories_id);


--
-- Name: posts_rels_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_rels_order_idx ON cms.posts_rels USING btree ("order");


--
-- Name: posts_rels_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_rels_parent_idx ON cms.posts_rels USING btree (parent_id);


--
-- Name: posts_rels_path_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_rels_path_idx ON cms.posts_rels USING btree (path);


--
-- Name: posts_rels_tags_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_rels_tags_id_idx ON cms.posts_rels USING btree (tags_id);


--
-- Name: posts_slug_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE UNIQUE INDEX posts_slug_idx ON cms.posts USING btree (slug);


--
-- Name: posts_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX posts_updated_at_idx ON cms.posts USING btree (updated_at);


--
-- Name: projects__status_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects__status_idx ON cms.projects USING btree (_status);


--
-- Name: projects_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_created_at_idx ON cms.projects USING btree (created_at);


--
-- Name: projects_feature_image_feature_image_image_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_feature_image_feature_image_image_idx ON cms.projects USING btree (feature_image_image_id);


--
-- Name: projects_rels_categories_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_rels_categories_id_idx ON cms.projects_rels USING btree (categories_id);


--
-- Name: projects_rels_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_rels_order_idx ON cms.projects_rels USING btree ("order");


--
-- Name: projects_rels_parent_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_rels_parent_idx ON cms.projects_rels USING btree (parent_id);


--
-- Name: projects_rels_path_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_rels_path_idx ON cms.projects_rels USING btree (path);


--
-- Name: projects_rels_tags_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_rels_tags_id_idx ON cms.projects_rels USING btree (tags_id);


--
-- Name: projects_slug_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE UNIQUE INDEX projects_slug_idx ON cms.projects USING btree (slug);


--
-- Name: projects_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX projects_updated_at_idx ON cms.projects USING btree (updated_at);


--
-- Name: tags_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX tags_created_at_idx ON cms.tags USING btree (created_at);


--
-- Name: tags_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX tags_updated_at_idx ON cms.tags USING btree (updated_at);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX users_created_at_idx ON cms.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE UNIQUE INDEX users_email_idx ON cms.users USING btree (email);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX users_sessions_order_idx ON cms.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX users_sessions_parent_id_idx ON cms.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: cms; Owner: postgres
--

CREATE INDEX users_updated_at_idx ON cms.users USING btree (updated_at);


--
-- Name: auth_account_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_account_userId_idx" ON public.auth_account USING btree (user_id);


--
-- Name: auth_session_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_session_userId_idx" ON public.auth_session USING btree (user_id);


--
-- Name: auth_verification_identifier_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_verification_identifier_idx ON public.auth_verification USING btree (identifier);


--
-- Name: lms_certificate_user_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_certificate_user_course_idx ON public.lms_certificate USING btree (user_id, course_id);


--
-- Name: lms_courses_platform_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_courses_platform_idx ON public.lms_courses USING btree (platform);


--
-- Name: lms_courses_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_courses_slug_idx ON public.lms_courses USING btree (slug);


--
-- Name: lms_enrollment_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_enrollment_course_idx ON public.lms_enrollment USING btree (course_id);


--
-- Name: lms_enrollment_user_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lms_enrollment_user_course_idx ON public.lms_enrollment USING btree (user_id, course_id);


--
-- Name: lms_lesson_progress_user_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_lesson_progress_user_course_idx ON public.lms_lesson_progress USING btree (user_id, course_id);


--
-- Name: lms_lesson_progress_user_lesson_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lms_lesson_progress_user_lesson_idx ON public.lms_lesson_progress USING btree (user_id, lesson_id);


--
-- Name: lms_lessons_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_lessons_course_idx ON public.lms_lessons USING btree (course_id);


--
-- Name: lms_lessons_course_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lms_lessons_course_slug_idx ON public.lms_lessons USING btree (course_id, slug);


--
-- Name: lms_lessons_module_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_lessons_module_idx ON public.lms_lessons USING btree (module_id);


--
-- Name: lms_lessons_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_lessons_order_idx ON public.lms_lessons USING btree ("order");


--
-- Name: lms_modules_course_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_modules_course_idx ON public.lms_modules USING btree (course_id);


--
-- Name: lms_modules_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lms_modules_order_idx ON public.lms_modules USING btree ("order");


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_selec; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_selec ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter, COALESCE(selected_columns, '{}'::text[]));


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: _posts_v _posts_v_parent_id_posts_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v
    ADD CONSTRAINT _posts_v_parent_id_posts_id_fk FOREIGN KEY (parent_id) REFERENCES cms.posts(id) ON DELETE SET NULL;


--
-- Name: _posts_v_rels _posts_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES cms.categories(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES cms._posts_v(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_tags_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_tags_fk FOREIGN KEY (tags_id) REFERENCES cms.tags(id) ON DELETE CASCADE;


--
-- Name: _posts_v _posts_v_version_feature_image_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._posts_v
    ADD CONSTRAINT _posts_v_version_feature_image_image_id_media_id_fk FOREIGN KEY (version_feature_image_image_id) REFERENCES cms.media(id) ON DELETE SET NULL;


--
-- Name: _projects_v _projects_v_parent_id_projects_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v
    ADD CONSTRAINT _projects_v_parent_id_projects_id_fk FOREIGN KEY (parent_id) REFERENCES cms.projects(id) ON DELETE SET NULL;


--
-- Name: _projects_v_rels _projects_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v_rels
    ADD CONSTRAINT _projects_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES cms.categories(id) ON DELETE CASCADE;


--
-- Name: _projects_v_rels _projects_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v_rels
    ADD CONSTRAINT _projects_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES cms._projects_v(id) ON DELETE CASCADE;


--
-- Name: _projects_v_rels _projects_v_rels_tags_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v_rels
    ADD CONSTRAINT _projects_v_rels_tags_fk FOREIGN KEY (tags_id) REFERENCES cms.tags(id) ON DELETE CASCADE;


--
-- Name: _projects_v _projects_v_version_feature_image_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms._projects_v
    ADD CONSTRAINT _projects_v_version_feature_image_image_id_media_id_fk FOREIGN KEY (version_feature_image_image_id) REFERENCES cms.media(id) ON DELETE SET NULL;


--
-- Name: payload_jobs_log payload_jobs_log_parent_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES cms.payload_jobs(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_categories_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES cms.categories(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES cms.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES cms.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_posts_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES cms.posts(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_projects_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_projects_fk FOREIGN KEY (projects_id) REFERENCES cms.projects(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_tags_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_tags_fk FOREIGN KEY (tags_id) REFERENCES cms.tags(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES cms.users(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES cms.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES cms.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_feature_image_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts
    ADD CONSTRAINT posts_feature_image_image_id_media_id_fk FOREIGN KEY (feature_image_image_id) REFERENCES cms.media(id) ON DELETE SET NULL;


--
-- Name: posts_rels posts_rels_categories_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts_rels
    ADD CONSTRAINT posts_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES cms.categories(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_parent_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts_rels
    ADD CONSTRAINT posts_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES cms.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_tags_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.posts_rels
    ADD CONSTRAINT posts_rels_tags_fk FOREIGN KEY (tags_id) REFERENCES cms.tags(id) ON DELETE CASCADE;


--
-- Name: projects projects_feature_image_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects
    ADD CONSTRAINT projects_feature_image_image_id_media_id_fk FOREIGN KEY (feature_image_image_id) REFERENCES cms.media(id) ON DELETE SET NULL;


--
-- Name: projects_rels projects_rels_categories_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects_rels
    ADD CONSTRAINT projects_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES cms.categories(id) ON DELETE CASCADE;


--
-- Name: projects_rels projects_rels_parent_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects_rels
    ADD CONSTRAINT projects_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES cms.projects(id) ON DELETE CASCADE;


--
-- Name: projects_rels projects_rels_tags_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.projects_rels
    ADD CONSTRAINT projects_rels_tags_fk FOREIGN KEY (tags_id) REFERENCES cms.tags(id) ON DELETE CASCADE;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: cms; Owner: postgres
--

ALTER TABLE ONLY cms.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES cms.users(id) ON DELETE CASCADE;


--
-- Name: auth_account auth_account_user_id_auth_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_account
    ADD CONSTRAINT auth_account_user_id_auth_user_id_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_session auth_session_user_id_auth_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_session
    ADD CONSTRAINT auth_session_user_id_auth_user_id_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: lms_certificate lms_certificate_course_id_lms_courses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_certificate
    ADD CONSTRAINT lms_certificate_course_id_lms_courses_id_fk FOREIGN KEY (course_id) REFERENCES public.lms_courses(id) ON DELETE CASCADE;


--
-- Name: lms_enrollment lms_enrollment_course_id_lms_courses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_enrollment
    ADD CONSTRAINT lms_enrollment_course_id_lms_courses_id_fk FOREIGN KEY (course_id) REFERENCES public.lms_courses(id) ON DELETE CASCADE;


--
-- Name: lms_lesson_progress lms_lesson_progress_course_id_lms_courses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_lesson_progress
    ADD CONSTRAINT lms_lesson_progress_course_id_lms_courses_id_fk FOREIGN KEY (course_id) REFERENCES public.lms_courses(id) ON DELETE CASCADE;


--
-- Name: lms_lesson_progress lms_lesson_progress_lesson_id_lms_lessons_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_lesson_progress
    ADD CONSTRAINT lms_lesson_progress_lesson_id_lms_lessons_id_fk FOREIGN KEY (lesson_id) REFERENCES public.lms_lessons(id) ON DELETE CASCADE;


--
-- Name: lms_lessons lms_lessons_course_id_lms_courses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_lessons
    ADD CONSTRAINT lms_lessons_course_id_lms_courses_id_fk FOREIGN KEY (course_id) REFERENCES public.lms_courses(id) ON DELETE CASCADE;


--
-- Name: lms_lessons lms_lessons_module_id_lms_modules_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_lessons
    ADD CONSTRAINT lms_lessons_module_id_lms_modules_id_fk FOREIGN KEY (module_id) REFERENCES public.lms_modules(id) ON DELETE CASCADE;


--
-- Name: lms_modules lms_modules_course_id_lms_courses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lms_modules
    ADD CONSTRAINT lms_modules_course_id_lms_courses_id_fk FOREIGN KEY (course_id) REFERENCES public.lms_courses(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION send_binary(payload bytea, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION wal2json_escape_identifier(name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO postgres;
GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE auth_account; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auth_account TO anon;
GRANT ALL ON TABLE public.auth_account TO authenticated;
GRANT ALL ON TABLE public.auth_account TO service_role;


--
-- Name: TABLE auth_session; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auth_session TO anon;
GRANT ALL ON TABLE public.auth_session TO authenticated;
GRANT ALL ON TABLE public.auth_session TO service_role;


--
-- Name: TABLE auth_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auth_user TO anon;
GRANT ALL ON TABLE public.auth_user TO authenticated;
GRANT ALL ON TABLE public.auth_user TO service_role;


--
-- Name: TABLE auth_verification; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auth_verification TO anon;
GRANT ALL ON TABLE public.auth_verification TO authenticated;
GRANT ALL ON TABLE public.auth_verification TO service_role;


--
-- Name: TABLE lms_certificate; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lms_certificate TO anon;
GRANT ALL ON TABLE public.lms_certificate TO authenticated;
GRANT ALL ON TABLE public.lms_certificate TO service_role;


--
-- Name: TABLE lms_courses; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lms_courses TO anon;
GRANT ALL ON TABLE public.lms_courses TO authenticated;
GRANT ALL ON TABLE public.lms_courses TO service_role;


--
-- Name: TABLE lms_enrollment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lms_enrollment TO anon;
GRANT ALL ON TABLE public.lms_enrollment TO authenticated;
GRANT ALL ON TABLE public.lms_enrollment TO service_role;


--
-- Name: TABLE lms_lesson_progress; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lms_lesson_progress TO anon;
GRANT ALL ON TABLE public.lms_lesson_progress TO authenticated;
GRANT ALL ON TABLE public.lms_lesson_progress TO service_role;


--
-- Name: TABLE lms_lessons; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lms_lessons TO anon;
GRANT ALL ON TABLE public.lms_lessons TO authenticated;
GRANT ALL ON TABLE public.lms_lessons TO service_role;


--
-- Name: TABLE lms_modules; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lms_modules TO anon;
GRANT ALL ON TABLE public.lms_modules TO authenticated;
GRANT ALL ON TABLE public.lms_modules TO service_role;


--
-- Name: TABLE store_product; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.store_product TO anon;
GRANT ALL ON TABLE public.store_product TO authenticated;
GRANT ALL ON TABLE public.store_product TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict oowQKmlgA8jnpzv5cexhW4I9cr6UCNYfp3Vurwfu3CWGgVb6OKn2caIsGIlzgr4

