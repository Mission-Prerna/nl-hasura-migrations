SET check_function_bodies = false;
CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;
COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public."School_Name" (
    udise_district_code integer NOT NULL,
    district_name character varying NOT NULL,
    udise_block_code integer NOT NULL,
    block_name character varying NOT NULL,
    school_name character varying(255) NOT NULL,
    udise_sch_code character varying NOT NULL
);
CREATE TABLE public.assessment_results (
    id integer NOT NULL,
    username text NOT NULL,
    udise text NOT NULL,
    school_name text NOT NULL,
    district_code text NOT NULL,
    block_code text NOT NULL,
    district_name text NOT NULL,
    block_name text NOT NULL,
    grade1_total integer NOT NULL,
    grade2_total integer NOT NULL,
    grade3_total integer NOT NULL,
    grade4_total integer NOT NULL,
    grade5_total integer NOT NULL,
    grade1_prerakstudents integer NOT NULL,
    grade2_prerakstudents integer NOT NULL,
    grade3_prerakstudents integer NOT NULL,
    grade4_prerakstudents integer NOT NULL,
    grade5_prerakstudents integer NOT NULL,
    date_of_assessment date NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);
CREATE SEQUENCE public.assessment_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.assessment_results_id_seq OWNED BY public.assessment_results.id;
CREATE TABLE public.assessment_survey_result (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    username text,
    results text,
    grade integer,
    subject text,
    school_udise bigint,
    actor text,
    id bigint NOT NULL
);
CREATE SEQUENCE public.assessment_survey_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.assessment_survey_result_id_seq OWNED BY public.assessment_survey_result.id;
CREATE TABLE public.assessment_visit_result_bc (
    id integer,
    created_at timestamp with time zone,
    grade integer,
    subject text,
    module_result text,
    is_visited boolean,
    mentor_id integer,
    no_of_student integer,
    udise_code text,
    total_time_taken text,
    actor text,
    block text,
    is_processed boolean DEFAULT false,
    id_not_available boolean
);
CREATE TABLE public.assessment_visit_result_date_map (
    visit_id integer,
    "timestamp" timestamp without time zone,
    mentor_id integer,
    school_udise bigint
);
CREATE SEQUENCE public.assessment_visit_result_flatten_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.assessment_visit_result_flatten (
    achievement integer,
    block character varying,
    competency character varying,
    district character varying,
    grade integer,
    subject character varying,
    total_questions integer,
    udise character varying,
    view_type character varying,
    id integer DEFAULT nextval('public.assessment_visit_result_flatten_id_seq'::regclass) NOT NULL,
    assessment_id integer NOT NULL,
    is_nipun integer DEFAULT 0,
    mentor_id integer,
    assessment_type character varying,
    created_at date,
    actor character varying,
    student_session character varying
);
CREATE TABLE public.assessment_visit_results (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    grade integer NOT NULL,
    subject text NOT NULL,
    module_result text NOT NULL,
    is_visited boolean DEFAULT false NOT NULL,
    mentor_id integer,
    no_of_student integer DEFAULT 0 NOT NULL,
    udise_code text NOT NULL,
    total_time_taken text DEFAULT 0 NOT NULL,
    actor text DEFAULT 'mentor'::text,
    block text,
    student_session character varying,
    assessment_type bpchar DEFAULT TRIM(BOTH FROM ''::text) NOT NULL,
    udise bigint DEFAULT 0 NOT NULL,
    block_id integer DEFAULT 0 NOT NULL,
    time_taken integer DEFAULT 0 NOT NULL,
    actor_id smallint DEFAULT 0 NOT NULL
);
CREATE SEQUENCE public.assessment_visit_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.assessment_visit_results_id_seq OWNED BY public.assessment_visit_results.id;
CREATE TABLE public.assessment_visit_results_module_results (
    id integer NOT NULL,
    module_res jsonb NOT NULL,
    length integer
);
CREATE SEQUENCE public.assessment_visit_results_module_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.assessment_visit_results_module_results_id_seq OWNED BY public.assessment_visit_results_module_results.id;
CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
CREATE TABLE public.competency_mapping (
    id integer NOT NULL,
    grade character varying NOT NULL,
    subject character varying,
    learning_outcome text,
    competency_id integer,
    flow_state integer DEFAULT 1 NOT NULL
);
CREATE SEQUENCE public.competency_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.competency_mapping_id_seq OWNED BY public.competency_mapping.id;
CREATE TABLE public.mentor (
    id bigint NOT NULL,
    phone_no character varying(100) NOT NULL,
    district_name character varying(100),
    block_town_name character varying(100) DEFAULT '-'::character varying,
    area_type character varying(100),
    officer_name character varying(100),
    designation character varying(100),
    subject_of_matter character varying(200),
    target_visits character varying(100),
    pin text
);
CREATE VIEW public.compliance_data AS
 SELECT m.id,
    monthresult.month,
    m.district_name,
    m.block_town_name,
    monthresult.school_udise,
    m.officer_name,
    m.area_type,
    m.designation,
    monthresult.attendancecount,
        CASE
            WHEN (((m.designation)::text = 'SRG'::text) OR ((m.designation)::text = 'S.R. G'::text)) THEN 20
            WHEN (((m.designation)::text = 'ARP'::text) OR ((m.designation)::text = 'ARP NAGAR'::text)) THEN 30
            WHEN ((m.designation)::text = 'Diet Mentor'::text) THEN 10
            ELSE NULL::integer
        END AS target_vistis
   FROM (public.mentor m
     JOIN ( SELECT dailyrecord.mentor_id,
            dailyrecord.school_udise,
            to_char((dailyrecord.assessment_date)::timestamp with time zone, 'Month'::text) AS month,
            count(1) AS attendancecount
           FROM ( SELECT count(1) AS count,
                    date(assessment_visit_result_date_map."timestamp") AS assessment_date,
                    assessment_visit_result_date_map.mentor_id,
                    assessment_visit_result_date_map.school_udise
                   FROM public.assessment_visit_result_date_map
                  GROUP BY (date(assessment_visit_result_date_map."timestamp")), assessment_visit_result_date_map.mentor_id, assessment_visit_result_date_map.school_udise) dailyrecord
          GROUP BY dailyrecord.mentor_id, (to_char((dailyrecord.assessment_date)::timestamp with time zone, 'Month'::text)), dailyrecord.school_udise) monthresult ON ((monthresult.mentor_id = m.id)));
CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);
CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;
CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);
CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;
CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);
CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;
CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);
CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;
CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);
CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);
CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;
CREATE TABLE public.django_celery_results_chordcounter (
    id bigint NOT NULL,
    group_id character varying(255) NOT NULL,
    sub_tasks text NOT NULL,
    count integer NOT NULL,
    CONSTRAINT django_celery_results_chordcounter_count_check CHECK ((count >= 0))
);
CREATE SEQUENCE public.django_celery_results_chordcounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_results_chordcounter_id_seq OWNED BY public.django_celery_results_chordcounter.id;
CREATE TABLE public.django_celery_results_taskresult (
    id bigint NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255),
    worker character varying(100),
    date_created timestamp with time zone NOT NULL
);
CREATE SEQUENCE public.django_celery_results_taskresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_celery_results_taskresult_id_seq OWNED BY public.django_celery_results_taskresult.id;
CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
CREATE TABLE public.employees (
    id integer NOT NULL,
    employee_name text NOT NULL,
    erhms_code text NOT NULL,
    designation text NOT NULL,
    posting_school text NOT NULL,
    reporting_block_office text NOT NULL,
    district text NOT NULL,
    default_role text DEFAULT 'Employee'::text,
    is_registered boolean,
    date_of_registration date,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    device_id text
);
CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
CREATE TABLE public.fcm_tokens (
    user_id integer NOT NULL,
    token text NOT NULL
);
CREATE TABLE public.form_config (
    id integer NOT NULL,
    grade integer NOT NULL,
    hindi_start_index integer NOT NULL,
    hindi_end_index integer NOT NULL,
    maths_start_index integer NOT NULL,
    maths_end_index integer NOT NULL
);
CREATE SEQUENCE public.form_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.form_config_id_seq OWNED BY public.form_config.id;
CREATE TABLE public.health_check_db_testmodel (
    id integer NOT NULL,
    title character varying(128) NOT NULL
);
CREATE SEQUENCE public.health_check_db_testmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.health_check_db_testmodel_id_seq OWNED BY public.health_check_db_testmodel.id;
CREATE TABLE public.homelearning_event (
    "deviceId" text NOT NULL,
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    subject text NOT NULL,
    "actualGrade" integer NOT NULL,
    "currentGrade" integer NOT NULL,
    grade1_trial1_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial2_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial3_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial4_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial5_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial1_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial2_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial3_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial4_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial1_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial2_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial3_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial4_correct_words integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial1_score integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial2_score integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial3_score integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial4_score integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial1_score integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial2_score integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial3_score integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial4_score integer DEFAULT '-1'::integer NOT NULL,
    grade4_trial1_score integer DEFAULT '-1'::integer NOT NULL,
    grade4_trial2_score integer DEFAULT '-1'::integer NOT NULL,
    grade4_trial3_score integer DEFAULT '-1'::integer NOT NULL,
    grade4_trial4_score integer DEFAULT '-1'::integer NOT NULL,
    grade5_trial1_score integer DEFAULT '-1'::integer NOT NULL,
    grade5_trial2_score integer DEFAULT '-1'::integer NOT NULL,
    grade5_trial3_score integer DEFAULT '-1'::integer NOT NULL,
    grade5_trial4_score integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial1_time integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial2_time integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial3_time integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial4_time integer DEFAULT '-1'::integer NOT NULL,
    grade1_trial5_time integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial1_time integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial2_time integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial3_time integer DEFAULT '-1'::integer NOT NULL,
    grade2_trial4_time integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial1_time integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial2_time integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial3_time integer DEFAULT '-1'::integer NOT NULL,
    grade3_trial4_time integer DEFAULT '-1'::integer NOT NULL,
    "isAssessmentComplete" boolean DEFAULT false NOT NULL,
    default_role text DEFAULT 'Employee'::text,
    erhms_code text DEFAULT '-'::text,
    "isUserTeacher" boolean DEFAULT false,
    push_time timestamp without time zone,
    district text DEFAULT '-'::text,
    block text DEFAULT '-'::text,
    score integer DEFAULT '-1'::integer,
    start_time timestamp with time zone DEFAULT now(),
    "appVersion" text DEFAULT '1.0'::text
);
CREATE SEQUENCE public.homelearning_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.homelearning_event_id_seq OWNED BY public.homelearning_event.id;
CREATE TABLE public.mentors (
    id integer NOT NULL,
    officer_name character varying,
    phone_no character varying NOT NULL,
    district_name character varying,
    block_town_name character varying,
    area_type character varying,
    designation character varying,
    subject_of_matter character varying,
    target_visits character varying,
    pin bytea
);
CREATE SEQUENCE public.mentor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mentor_id_seq OWNED BY public.mentors.id;
CREATE SEQUENCE public.mentor_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mentor_id_seq1 OWNED BY public.mentor.id;
CREATE TABLE public.mentor_segmentation (
    id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    segment_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.mentor_segmentation IS 'Table to store mentor segmentation mapping';
CREATE SEQUENCE public.mentor_segmentation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mentor_segmentation_id_seq OWNED BY public.mentor_segmentation.id;
CREATE TABLE public.mentor_tokens (
    id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.mentor_tokens IS 'Table to store FCM tokens for the mentors';
CREATE SEQUENCE public.mentor_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mentor_tokens_id_seq OWNED BY public.mentor_tokens.id;
CREATE SEQUENCE public.mentors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;
CREATE TABLE public.new_table (
    achievement jsonb,
    grade jsonb,
    subject jsonb,
    total_questions jsonb,
    competency jsonb,
    udise jsonb,
    district jsonb,
    block jsonb,
    view_type jsonb
);
CREATE TABLE public.school (
    id integer NOT NULL,
    "districtCode" text NOT NULL,
    "districtName" text NOT NULL,
    "blockCode" text NOT NULL,
    "blockName" text NOT NULL,
    "schoolName" text NOT NULL,
    udise text NOT NULL,
    location text NOT NULL,
    type text NOT NULL
);
CREATE SEQUENCE public.school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.school_id_seq OWNED BY public.school.id;
CREATE TABLE public.school_list (
    id integer NOT NULL,
    district character varying NOT NULL,
    area_type character varying NOT NULL,
    block character varying NOT NULL,
    nypanchayat character varying NOT NULL,
    type character varying,
    category character varying,
    name character varying,
    udise_code character varying,
    total_student_registered integer,
    is_sankul boolean DEFAULT false NOT NULL
);
CREATE SEQUENCE public.school_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.school_list_id_seq OWNED BY public.school_list.id;
CREATE TABLE public.school_updated_udise (
    id integer NOT NULL,
    "districtCode" character varying NOT NULL,
    "districtName" character varying NOT NULL,
    "blockCode" character varying NOT NULL,
    "blockName" character varying NOT NULL,
    "schoolName" character varying NOT NULL,
    udise character varying NOT NULL,
    location character varying NOT NULL,
    type character varying NOT NULL,
    schooludise character varying NOT NULL
);
CREATE TABLE public.school_updated_udise1 (
    id integer NOT NULL,
    "districtCode" integer NOT NULL,
    "districtName" character varying NOT NULL,
    "blockCode" integer NOT NULL,
    "blockName" character varying NOT NULL,
    "schoolName" character varying NOT NULL,
    udise bigint NOT NULL,
    location character varying NOT NULL,
    type character varying NOT NULL,
    schooludise bigint NOT NULL
);
CREATE TABLE public.school_visit (
    school_visit_status boolean DEFAULT false NOT NULL,
    time_stamp timestamp with time zone DEFAULT now() NOT NULL,
    id integer NOT NULL,
    school_udise text NOT NULL,
    mentor_id integer
);
CREATE SEQUENCE public.school_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.school_visit_id_seq OWNED BY public.school_visit.id;
CREATE SEQUENCE public.scpmw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.script_config (
    performance_last_process_id integer NOT NULL,
    id integer NOT NULL,
    perf_create_id integer,
    visit_wise_student_result_visit_id integer,
    month_wise_performance_last_process_id bigint
);
CREATE SEQUENCE public.sprmw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.script_performance_month_wise_report (
    id integer DEFAULT nextval('public.sprmw_id_seq'::regclass) NOT NULL,
    district character varying NOT NULL,
    block character varying NOT NULL,
    school_udise character varying,
    grade integer,
    subject character varying,
    competency character varying,
    month integer,
    student_accessed integer,
    nipun_students integer,
    year integer
);
CREATE SEQUENCE public.spr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.script_performance_report (
    id integer DEFAULT nextval('public.spr_id_seq'::regclass) NOT NULL,
    district character varying NOT NULL,
    block character varying NOT NULL,
    school_udise character varying,
    grade integer,
    subject character varying,
    competency character varying,
    student_accessed integer,
    nipun_students integer
);
CREATE TABLE public.script_performance_report1 (
    id integer,
    district character varying,
    block character varying,
    school_udise character varying,
    grade integer,
    subject character varying,
    competency character varying,
    student_accessed integer,
    nipun_students integer,
    visit_res_id integer
);
CREATE TABLE public.script_performance_report_mentor_wise (
    id integer DEFAULT nextval('public.scpmw_id_seq'::regclass) NOT NULL,
    district character varying NOT NULL,
    block character varying NOT NULL,
    school_udise character varying,
    grade integer,
    subject character varying,
    competency character varying,
    student_accessed integer,
    nipun_students integer,
    mentor_id integer,
    assessment_type character varying,
    actor character varying,
    created_at date
);
CREATE TABLE public.segment_bots (
    id bigint NOT NULL,
    segment_id bigint NOT NULL,
    bot_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.segment_bots IS 'Table to hold segment_id & bot id mapping';
CREATE SEQUENCE public.segment_bots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.segment_bots_id_seq OWNED BY public.segment_bots.id;
CREATE TABLE public.segments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.segments IS 'table to store chatbot segments/bots information (which are to be mapped with mentors)';
CREATE SEQUENCE public.segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.segments_id_seq OWNED BY public.segments.id;
CREATE TABLE public.start_learning_event (
    "deviceId" text NOT NULL,
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    subject text NOT NULL,
    "actualGrade" integer NOT NULL,
    default_role text DEFAULT 'Employee'::text,
    "isUserTeacher" boolean DEFAULT false,
    erhms_code text DEFAULT '-'::text,
    start_time timestamp without time zone
);
CREATE SEQUENCE public.start_learning_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.start_learning_event_id_seq OWNED BY public.start_learning_event.id;
CREATE TABLE public.student_install (
    default_role text DEFAULT 'Employee'::text NOT NULL,
    district text NOT NULL,
    block text NOT NULL,
    count integer DEFAULT 1 NOT NULL,
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    device_id text,
    persona text DEFAULT '-'::text,
    version text DEFAULT '-'::text
);
CREATE SEQUENCE public.student_install_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.student_install_id_seq OWNED BY public.student_install.id;
CREATE TABLE public.teacher_school_list_mapping (
    mentor_id bigint NOT NULL,
    school_list_id integer NOT NULL,
    id integer NOT NULL
);
CREATE SEQUENCE public.teacher_school_list_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.teacher_school_list_mapping_id_seq OWNED BY public.teacher_school_list_mapping.id;
CREATE SEQUENCE public.tvwsr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.temp_visit_wise_student_result (
    id bigint DEFAULT nextval('public.tvwsr_id_seq'::regclass) NOT NULL,
    visit_id integer,
    competency character varying,
    current_student_count integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    achievement integer,
    total_questions integer,
    success_criteria integer,
    view_type character varying
);
CREATE TABLE public.visit_wise_student_result (
    id bigint NOT NULL,
    visit_id integer,
    competency character varying,
    current_student_count integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    achievement integer,
    total_questions integer,
    success_criteria integer,
    view_type character varying
);
CREATE SEQUENCE public.visit_wise_student_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.visit_wise_student_result_id_seq OWNED BY public.visit_wise_student_result.id;
CREATE TABLE public.workflow_refids_mapping (
    grade integer NOT NULL,
    subject text NOT NULL,
    competency_id integer NOT NULL,
    type text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    ref_ids jsonb DEFAULT '[]'::jsonb NOT NULL,
    id integer NOT NULL,
    assessment_type bpchar DEFAULT TRIM(BOTH FROM ''::text) NOT NULL
);
CREATE SEQUENCE public.workflow_refids_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.workflow_refids_mapping_id_seq OWNED BY public.workflow_refids_mapping.id;
CREATE TABLE public.wrm (
    grade integer,
    subject text,
    competency_id integer,
    type text,
    is_active boolean,
    ref_ids jsonb
);
ALTER TABLE ONLY public.assessment_results ALTER COLUMN id SET DEFAULT nextval('public.assessment_results_id_seq'::regclass);
ALTER TABLE ONLY public.assessment_survey_result ALTER COLUMN id SET DEFAULT nextval('public.assessment_survey_result_id_seq'::regclass);
ALTER TABLE ONLY public.assessment_visit_results ALTER COLUMN id SET DEFAULT nextval('public.assessment_visit_results_id_seq'::regclass);
ALTER TABLE ONLY public.assessment_visit_results_module_results ALTER COLUMN id SET DEFAULT nextval('public.assessment_visit_results_module_results_id_seq'::regclass);
ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
ALTER TABLE ONLY public.competency_mapping ALTER COLUMN id SET DEFAULT nextval('public.competency_mapping_id_seq'::regclass);
ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_results_chordcounter ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_chordcounter_id_seq'::regclass);
ALTER TABLE ONLY public.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_taskresult_id_seq'::regclass);
ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
ALTER TABLE ONLY public.form_config ALTER COLUMN id SET DEFAULT nextval('public.form_config_id_seq'::regclass);
ALTER TABLE ONLY public.health_check_db_testmodel ALTER COLUMN id SET DEFAULT nextval('public.health_check_db_testmodel_id_seq'::regclass);
ALTER TABLE ONLY public.homelearning_event ALTER COLUMN id SET DEFAULT nextval('public.homelearning_event_id_seq'::regclass);
ALTER TABLE ONLY public.mentor ALTER COLUMN id SET DEFAULT nextval('public.mentor_id_seq1'::regclass);
ALTER TABLE ONLY public.mentor_segmentation ALTER COLUMN id SET DEFAULT nextval('public.mentor_segmentation_id_seq'::regclass);
ALTER TABLE ONLY public.mentor_tokens ALTER COLUMN id SET DEFAULT nextval('public.mentor_tokens_id_seq'::regclass);
ALTER TABLE ONLY public.mentors ALTER COLUMN id SET DEFAULT nextval('public.mentor_id_seq'::regclass);
ALTER TABLE ONLY public.school ALTER COLUMN id SET DEFAULT nextval('public.school_id_seq'::regclass);
ALTER TABLE ONLY public.school_list ALTER COLUMN id SET DEFAULT nextval('public.school_list_id_seq'::regclass);
ALTER TABLE ONLY public.school_visit ALTER COLUMN id SET DEFAULT nextval('public.school_visit_id_seq'::regclass);
ALTER TABLE ONLY public.segment_bots ALTER COLUMN id SET DEFAULT nextval('public.segment_bots_id_seq'::regclass);
ALTER TABLE ONLY public.segments ALTER COLUMN id SET DEFAULT nextval('public.segments_id_seq'::regclass);
ALTER TABLE ONLY public.start_learning_event ALTER COLUMN id SET DEFAULT nextval('public.start_learning_event_id_seq'::regclass);
ALTER TABLE ONLY public.student_install ALTER COLUMN id SET DEFAULT nextval('public.student_install_id_seq'::regclass);
ALTER TABLE ONLY public.teacher_school_list_mapping ALTER COLUMN id SET DEFAULT nextval('public.teacher_school_list_mapping_id_seq'::regclass);
ALTER TABLE ONLY public.visit_wise_student_result ALTER COLUMN id SET DEFAULT nextval('public.visit_wise_student_result_id_seq'::regclass);
ALTER TABLE ONLY public.workflow_refids_mapping ALTER COLUMN id SET DEFAULT nextval('public.workflow_refids_mapping_id_seq'::regclass);
ALTER TABLE ONLY public.assessment_results
    ADD CONSTRAINT assessment_results_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.assessment_survey_result
    ADD CONSTRAINT assessment_survey_result_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.assessment_visit_result_flatten
    ADD CONSTRAINT assessment_visit_result_flatten_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.assessment_visit_results_module_results
    ADD CONSTRAINT assessment_visit_results_module_results_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.assessment_visit_results
    ADD CONSTRAINT assessment_visit_results_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
ALTER TABLE ONLY public.competency_mapping
    ADD CONSTRAINT competency_mapping_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);
ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);
ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);
ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_group_id_key UNIQUE (group_id);
ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);
ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id, erhms_code);
ALTER TABLE ONLY public.fcm_tokens
    ADD CONSTRAINT fcm_tokens_pkey PRIMARY KEY (user_id);
ALTER TABLE ONLY public.form_config
    ADD CONSTRAINT form_config_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.health_check_db_testmodel
    ADD CONSTRAINT health_check_db_testmodel_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.homelearning_event
    ADD CONSTRAINT homelearning_event_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mentor
    ADD CONSTRAINT mentor_phone_no_key UNIQUE (phone_no);
ALTER TABLE ONLY public.mentor
    ADD CONSTRAINT mentor_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mentor_segmentation
    ADD CONSTRAINT mentor_segmentation_mentor_id_segment_id_key UNIQUE (mentor_id, segment_id);
ALTER TABLE ONLY public.mentor_segmentation
    ADD CONSTRAINT mentor_segmentation_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mentor_tokens
    ADD CONSTRAINT mentor_tokens_mentor_id_key UNIQUE (mentor_id);
ALTER TABLE ONLY public.mentor_tokens
    ADD CONSTRAINT mentor_tokens_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_id_key UNIQUE (id);
ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.school_list
    ADD CONSTRAINT school_list_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.school_list
    ADD CONSTRAINT school_list_udise_code_key UNIQUE (udise_code);
ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_udise_key UNIQUE (udise);
ALTER TABLE ONLY public.school_visit
    ADD CONSTRAINT school_visit_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.script_config
    ADD CONSTRAINT scipt_config_pk PRIMARY KEY (id);
ALTER TABLE ONLY public.script_performance_month_wise_report
    ADD CONSTRAINT script_performance_month_wise_report_pk PRIMARY KEY (id);
ALTER TABLE ONLY public.script_performance_report_mentor_wise
    ADD CONSTRAINT script_performance_report_mentor_wise_pk PRIMARY KEY (id);
ALTER TABLE ONLY public.script_performance_report
    ADD CONSTRAINT script_performance_report_pk PRIMARY KEY (id);
ALTER TABLE ONLY public.segment_bots
    ADD CONSTRAINT segment_bots_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.segment_bots
    ADD CONSTRAINT segment_bots_segment_id_bot_id_key UNIQUE (segment_id, bot_id);
ALTER TABLE ONLY public.segments
    ADD CONSTRAINT segments_name_key UNIQUE (name);
ALTER TABLE ONLY public.segments
    ADD CONSTRAINT segments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.start_learning_event
    ADD CONSTRAINT start_learning_event_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.student_install
    ADD CONSTRAINT student_install_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.teacher_school_list_mapping
    ADD CONSTRAINT teacher_school_list_mapping_mentor_id_school_list_id_key UNIQUE (mentor_id, school_list_id);
ALTER TABLE ONLY public.teacher_school_list_mapping
    ADD CONSTRAINT teacher_school_list_mapping_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.temp_visit_wise_student_result
    ADD CONSTRAINT temp_visit_wise_student_result_pk PRIMARY KEY (id);
ALTER TABLE ONLY public.visit_wise_student_result
    ADD CONSTRAINT visit_wise_student_result_pk PRIMARY KEY (id);
ALTER TABLE ONLY public.workflow_refids_mapping
    ADD CONSTRAINT workflow_refids_mapping_competency_id_type_grade_subject_assess UNIQUE (competency_id, type, grade, subject, assessment_type);
ALTER TABLE ONLY public.workflow_refids_mapping
    ADD CONSTRAINT workflow_refids_mapping_id_key UNIQUE (id);
ALTER TABLE ONLY public.workflow_refids_mapping
    ADD CONSTRAINT workflow_refids_mapping_pkey PRIMARY KEY (id);
CREATE INDEX assessment_survey_result_username_idx ON public.assessment_survey_result USING btree (username);
CREATE INDEX assessment_visit_result_actor_block_index ON public.assessment_visit_results USING btree (actor, block);
CREATE INDEX assessment_visit_result_actor_index ON public.assessment_visit_results USING btree (actor);
CREATE INDEX assessment_visit_result_block_index ON public.assessment_visit_results USING btree (block);
CREATE INDEX "assessment_visit_result_flatten_ grade_idx" ON public.assessment_visit_result_flatten USING btree (grade);
CREATE INDEX assessment_visit_result_flatten_achievement_idx ON public.assessment_visit_result_flatten USING btree (achievement);
CREATE INDEX assessment_visit_result_flatten_actor_idx ON public.assessment_visit_result_flatten USING btree (actor);
CREATE INDEX assessment_visit_result_flatten_ass_id_idx ON public.assessment_visit_result_flatten USING btree (assessment_id);
CREATE INDEX assessment_visit_result_flatten_assessment_type_idx ON public.assessment_visit_result_flatten USING btree (assessment_type);
CREATE INDEX assessment_visit_result_flatten_block_idx ON public.assessment_visit_result_flatten USING btree (block);
CREATE INDEX assessment_visit_result_flatten_competency_idx ON public.assessment_visit_result_flatten USING btree (competency);
CREATE INDEX assessment_visit_result_flatten_created_at_idx ON public.assessment_visit_result_flatten USING btree (created_at);
CREATE INDEX assessment_visit_result_flatten_district_idx ON public.assessment_visit_result_flatten USING btree (district);
CREATE INDEX assessment_visit_result_flatten_is_nipun_idx ON public.assessment_visit_result_flatten USING btree (is_nipun);
CREATE INDEX assessment_visit_result_flatten_mentor_id_idx ON public.assessment_visit_result_flatten USING btree (mentor_id);
CREATE INDEX assessment_visit_result_flatten_udise_idx ON public.assessment_visit_result_flatten USING btree (udise);
CREATE INDEX assessment_visit_result_flatten_view_tye_idx ON public.assessment_visit_result_flatten USING btree (view_type);
CREATE INDEX assessment_visit_results_module_results_length_index ON public.assessment_visit_results_module_results USING btree (length);
CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
CREATE INDEX competency_mapping_lo_index ON public.competency_mapping USING btree (learning_outcome);
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);
CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);
CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);
CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);
CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);
CREATE INDEX django_celery_results_chordcounter_group_id_1f70858c_like ON public.django_celery_results_chordcounter USING btree (group_id varchar_pattern_ops);
CREATE INDEX django_celery_results_taskresult_date_created_099f3424 ON public.django_celery_results_taskresult USING btree (date_created);
CREATE INDEX django_celery_results_taskresult_date_done_49edada6 ON public.django_celery_results_taskresult USING btree (date_done);
CREATE INDEX django_celery_results_taskresult_status_cbbed23a ON public.django_celery_results_taskresult USING btree (status);
CREATE INDEX django_celery_results_taskresult_status_cbbed23a_like ON public.django_celery_results_taskresult USING btree (status varchar_pattern_ops);
CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);
CREATE INDEX django_celery_results_taskresult_task_name_90987df3 ON public.django_celery_results_taskresult USING btree (task_name);
CREATE INDEX django_celery_results_taskresult_task_name_90987df3_like ON public.django_celery_results_taskresult USING btree (task_name varchar_pattern_ops);
CREATE INDEX django_celery_results_taskresult_worker_f8711389 ON public.django_celery_results_taskresult USING btree (worker);
CREATE INDEX django_celery_results_taskresult_worker_f8711389_like ON public.django_celery_results_taskresult USING btree (worker varchar_pattern_ops);
CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
CREATE INDEX idx_assessment_visit_results_actor_block_id ON public.assessment_visit_results USING btree (actor_id, block_id);
CREATE INDEX idx_assessment_visit_results_actor_id ON public.assessment_visit_results USING btree (actor_id);
CREATE INDEX idx_assessment_visit_results_block_id ON public.assessment_visit_results USING btree (block_id);
CREATE INDEX idx_assessment_visit_results_created_at_mentor_id ON public.assessment_visit_results USING btree (created_at, mentor_id);
CREATE INDEX idx_assessment_visit_results_mentor_id ON public.assessment_visit_results USING btree (mentor_id);
CREATE INDEX idx_assessment_visit_results_student_session ON public.assessment_visit_results USING btree (student_session);
CREATE INDEX idx_assessment_visit_results_udise ON public.assessment_visit_results USING btree (udise);
CREATE INDEX idx_assessment_visit_results_udise_code ON public.assessment_visit_results USING btree (udise_code);
CREATE INDEX idx_mentor_phone_no ON public.mentor USING btree (phone_no);
CREATE INDEX mentor_segmentation_mentor_id_idx ON public.mentor_segmentation USING btree (mentor_id);
CREATE INDEX mentor_segmentation_segment_id_idx ON public.mentor_segmentation USING btree (segment_id);
CREATE INDEX sch_list_block_dist_index ON public.school_list USING btree (block, district);
CREATE INDEX schl_list_block_index ON public.school_list USING btree (block);
CREATE INDEX schl_list_district_index ON public.school_list USING btree (district);
CREATE INDEX schl_list_type_index ON public.school_list USING btree (type);
CREATE INDEX scp_competency_idx ON public.script_performance_report USING btree (competency);
CREATE INDEX scp_grade_idx ON public.script_performance_report USING btree (grade);
CREATE INDEX scp_school_udise_idx ON public.script_performance_report USING btree (school_udise);
CREATE INDEX scp_subject_idx ON public.script_performance_report USING btree (subject);
CREATE INDEX scpmw_actor_index ON public.script_performance_report_mentor_wise USING btree (actor);
CREATE INDEX scpmw_assessment_type_index ON public.script_performance_report_mentor_wise USING btree (assessment_type);
CREATE INDEX scpmw_competency_idx ON public.script_performance_report_mentor_wise USING btree (competency);
CREATE INDEX scpmw_created_at_index ON public.script_performance_report_mentor_wise USING btree (created_at);
CREATE INDEX scpmw_grade_idx ON public.script_performance_report_mentor_wise USING btree (grade);
CREATE INDEX scpmw_mentor_id_index ON public.script_performance_report_mentor_wise USING btree (mentor_id);
CREATE UNIQUE INDEX scpmw_school_udise_grade_subject_competency_mentor_id_assessmen ON public.script_performance_report_mentor_wise USING btree (district, block, school_udise, grade, subject, competency, mentor_id, assessment_type, actor, created_at);
CREATE INDEX scpmw_school_udise_idx ON public.script_performance_report_mentor_wise USING btree (school_udise);
CREATE INDEX scpmw_subject_idx ON public.script_performance_report_mentor_wise USING btree (subject);
CREATE INDEX segment_bots_segment_id_idx ON public.segment_bots USING btree (segment_id);
CREATE INDEX sprmw_competency_idx ON public.script_performance_month_wise_report USING btree (competency);
CREATE INDEX sprmw_grade_idx ON public.script_performance_month_wise_report USING btree (grade);
CREATE INDEX sprmw_school_udise_idx ON public.script_performance_month_wise_report USING btree (school_udise);
CREATE INDEX sprmw_subject_idx ON public.script_performance_month_wise_report USING btree (subject);
CREATE INDEX visit_wise_st_res_competency_index ON public.visit_wise_student_result USING btree (competency);
CREATE INDEX visit_wise_st_res_end_time_index ON public.visit_wise_student_result USING btree (end_time);
CREATE INDEX visit_wise_st_res_start_time_index ON public.visit_wise_student_result USING btree (start_time);
CREATE INDEX visit_wise_st_res_visit_id_index ON public.visit_wise_student_result USING btree (visit_id);
CREATE TRIGGER set_public_employees_updated_at BEFORE UPDATE ON public.employees FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_employees_updated_at ON public.employees IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_homelearning_event_updated_at BEFORE UPDATE ON public.homelearning_event FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_homelearning_event_updated_at ON public.homelearning_event IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_mentor_tokens_updated_at BEFORE UPDATE ON public.mentor_tokens FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_mentor_tokens_updated_at ON public.mentor_tokens IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_segments_updated_at BEFORE UPDATE ON public.segments FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_segments_updated_at ON public.segments IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_start_learning_event_updated_at BEFORE UPDATE ON public.start_learning_event FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_start_learning_event_updated_at ON public.start_learning_event IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_student_install_updated_at BEFORE UPDATE ON public.student_install FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_student_install_updated_at ON public.student_install IS 'trigger to set value of column "updated_at" to current timestamp on row update';
ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.fcm_tokens
    ADD CONSTRAINT fcm_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.mentor(id);
ALTER TABLE ONLY public.mentor_segmentation
    ADD CONSTRAINT mentor_segmentation_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentor(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.mentor_segmentation
    ADD CONSTRAINT mentor_segmentation_segment_id_fkey FOREIGN KEY (segment_id) REFERENCES public.segments(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.mentor_tokens
    ADD CONSTRAINT mentor_tokens_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentor(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.school_visit
    ADD CONSTRAINT school_visit_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.school_visit
    ADD CONSTRAINT school_visit_school_udise_fkey FOREIGN KEY (school_udise) REFERENCES public.school_list(udise_code) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.segment_bots
    ADD CONSTRAINT segment_bots_segment_id_fkey FOREIGN KEY (segment_id) REFERENCES public.segments(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.teacher_school_list_mapping
    ADD CONSTRAINT teacher_school_list_mapping_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentor(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.teacher_school_list_mapping
    ADD CONSTRAINT teacher_school_list_mapping_school_list_id_fkey FOREIGN KEY (school_list_id) REFERENCES public.school_list(id) ON UPDATE CASCADE ON DELETE CASCADE;
