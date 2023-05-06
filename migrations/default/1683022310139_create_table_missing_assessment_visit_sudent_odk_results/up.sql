create table assessment_visit_results_students_2023_apr_jun
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2023_apr_jun_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2023_apr_jun_assessment_vi
            references assessment_visit_results_v2_2023_apr_jun
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2023_apr_jun_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2023_jul_sep
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2023_jul_sep_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2023_jul_sep_assessment_vi
            references assessment_visit_results_v2_2023_jul_sep
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2023_jul_sep_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2023_oct_dec
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2023_oct_dec_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2023_oct_dec_assessment_vi
            references assessment_visit_results_v2_2023_oct_dec
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2023_oct_dec_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2024_jan_mar
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2024_jan_mar_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2024_jan_mar_assessment_vi
            references assessment_visit_results_v2_2024_jan_mar
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2024_jan_mar_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2024_apr_jun
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2024_apr_jun_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2024_apr_jun_assessment_vi
            references assessment_visit_results_v2_2024_apr_jun
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2024_apr_jun_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2024_jul_sep
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2024_jul_sep_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2024_jul_sep_assessment_vi
            references assessment_visit_results_v2_2024_jul_sep
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2024_jul_sep_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2024_oct_dec
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2024_oct_dec_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2024_oct_dec_assessment_vi
            references assessment_visit_results_v2_2024_oct_dec
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2024_oct_dec_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2025_jan_mar
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2025_jan_mar_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2025_jan_mar_assessment_vi
            references assessment_visit_results_v2_2025_jan_mar
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2025_jan_mar_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2025_apr_jun
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2025_apr_jun_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2025_apr_jun_assessment_vi
            references assessment_visit_results_v2_2025_apr_jun
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2025_apr_jun_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2025_jul_sep
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2025_jul_sep_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2025_jul_sep_assessment_vi
            references assessment_visit_results_v2_2025_jul_sep
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2025_jul_sep_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);

create table assessment_visit_results_students_2025_oct_dec
(
    id                             bigserial not null
        constraint assessment_visit_results_students_2025_oct_dec_pkey
            primary key,
    student_name                   varchar   not null,
    competency_id                  integer   not null,
    module                         varchar   not null,
    end_time                       bigint    not null,
    is_passed                      boolean   not null,
    start_time                     bigint    not null,
    statement                      text,
    achievement                    integer   not null,
    total_questions                integer   not null,
    success_criteria               integer   not null,
    session_completed              boolean   not null,
    is_network_active              boolean   not null,
    workflow_ref_id                varchar   not null,
    assessment_visit_results_v2_id bigint    not null
        constraint assessment_visit_results_students_2025_oct_dec_assessment_vi
            references assessment_visit_results_v2_2025_oct_dec
            on update cascade on delete cascade,
    student_session                uuid,
    total_time_taken               integer,
    constraint assessment_visit_results_students_2025_oct_dec_ss_com_avr_v2_id
        unique (student_session, competency_id, assessment_visit_results_v2_id)
);


create table assessment_visit_results_student_odk_results_2023_apr_jun
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2023_apr_jun_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2023_apr_jun_fkey
            references assessment_visit_results_students_2023_apr_jun
            on update cascade on delete cascade
);

create table assessment_visit_results_student_odk_results_2023_jul_sep
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2023_jul_sep_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2023_jul_sep_fkey
            references assessment_visit_results_students_2023_jul_sep
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2023_oct_dec
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2023_oct_dec_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2023_oct_dec_fkey
            references assessment_visit_results_students_2023_oct_dec
            on update cascade on delete cascade
);

create table assessment_visit_results_student_odk_results_2024_jan_mar
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2024_jan_mar_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2024_jan_mar_fkey
            references assessment_visit_results_students_2024_jan_mar
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2024_apr_jun
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2024_apr_jun_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2024_apr_jun_fkey
            references assessment_visit_results_students_2024_apr_jun
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2024_jul_sep
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2024_jul_sep_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2024_jul_sep_fkey
            references assessment_visit_results_students_2024_jul_sep
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2024_oct_dec
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2024_oct_dec_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2024_oct_dec_fkey
            references assessment_visit_results_students_2024_oct_dec
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2025_jan_mar
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2025_jan_mar_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2025_jan_mar_fkey
            references assessment_visit_results_students_2025_jan_mar
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2025_apr_jun
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2025_apr_jun_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2025_apr_jun_fkey
            references assessment_visit_results_students_2025_apr_jun
            on update cascade on delete cascade
);

create table assessment_visit_results_student_odk_results_2025_jul_sep
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2025_jul_sep_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2025_jul_sep_fkey
            references assessment_visit_results_students_2025_jul_sep
            on update cascade on delete cascade
);


create table assessment_visit_results_student_odk_results_2025_oct_dec
(
    id                                   bigserial not null
        constraint assessment_visit_results_student_odk_results_2025_oct_dec_pkey
            primary key,
    question                             text      not null,
    answer                               varchar   not null,
    assessment_visit_results_students_id bigint    not null
        constraint assessment_visit_results_student_odk_results_2025_oct_dec_fkey
            references assessment_visit_results_students_2025_oct_dec
            on update cascade on delete cascade
);