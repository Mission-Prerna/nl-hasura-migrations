create table assessment_visit_results_v2_2023_oct_dec
(
    id                   bigserial                                      not null
        constraint assessment_visit_results_v2_2023_oct_dec_pkey
            primary key,
    created_at           timestamp with time zone default now()         not null,
    grade                smallint                                       not null,
    subject_id           integer                                        not null
        constraint assessment_visit_results_v2_2023_oct_dec_subject_id_fkey
            references subjects
            on update cascade on delete restrict,
    module_result        jsonb                                          not null,
    is_visited           boolean                  default false         not null,
    mentor_id            bigint
        constraint assessment_visit_results_v2_2023_oct_dec_mentor_id_fkey
            references mentor
            on update cascade on delete cascade,
    no_of_student        integer                  default 0             not null,
    actor_id             integer                                        not null
        constraint assessment_visit_results_v2_2023_oct_dec_actor_id_fkey
            references actors
            on update cascade on delete restrict,
    block_id             integer
        constraint assessment_visit_results_v2_2023_oct_dec_block_id_fkey
            references blocks
            on update cascade on delete restrict,
    assessment_type_id   integer,
    udise                bigint
        constraint assessment_visit_results_v2_2023_oct_dec_udise_fkey
            references school_list (udise)
            on update cascade on delete restrict,
    submission_timestamp bigint                   default '0'::bigint   not null,
    app_version_code     integer                  default 0             not null,
    v                    smallint                 default '2'::smallint not null,
    constraint assessment_visit_results_v2_2023_oct_dec_unique
        unique (udise, mentor_id, grade, subject_id, submission_timestamp)
);

create index assessment_visit_results_v2_2023_oct_dec_block_id_idx
    on assessment_visit_results_v2_2023_oct_dec (block_id);

create index assessment_visit_results_v2_2023_oct_dec_subject_id_idx
    on assessment_visit_results_v2_2023_oct_dec (subject_id);

create index assessment_visit_results_v2_2023_oct_dec_actor_id_idx
    on assessment_visit_results_v2_2023_oct_dec (actor_id);

create index assessment_visit_results_v2_2023_oct_dec_actor_block_id_idx
    on assessment_visit_results_v2_2023_oct_dec (actor_id, block_id);

create index assessment_visit_results_v2_2023_oct_dec_created_at_idx
    on assessment_visit_results_v2_2023_oct_dec (created_at);

create index assessment_visit_results_v2_2023_oct_dec_ass_type_id_idx
    on assessment_visit_results_v2_2023_oct_dec (assessment_type_id);

create index assessment_visit_results_v2_2023_oct_dec_udise_idx
    on assessment_visit_results_v2_2023_oct_dec (udise);

create index assessment_visit_results_v2_2023_oct_dec_mentor_id_idx
    on assessment_visit_results_v2_2023_oct_dec (mentor_id);

create index assessment_visit_results_v2_2023_oct_dec_cr_mntid_idx
    on assessment_visit_results_v2_2023_oct_dec (created_at, mentor_id);

create index assessment_visit_results_v2_2023_oct_dec_sbsn_tz_idx
    on assessment_visit_results_v2_2023_oct_dec (submission_timestamp);
