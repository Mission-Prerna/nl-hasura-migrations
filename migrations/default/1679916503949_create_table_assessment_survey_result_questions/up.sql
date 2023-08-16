create table assessment_survey_result_questions
(
    id         bigserial                              not null
        constraint assessment_survey_result_questions_pkey
            primary key,
    survey_id  bigint                                 not null
        constraint assessment_survey_result_questions_survey_id_fkey
            references assessment_survey_result_v2
            on update cascade on delete cascade,
    qid        bpchar                                 not null,
    value      varchar                                not null,
    created_at timestamp with time zone default now() not null,
    constraint assessment_survey_result_questions_survey_id_qid_key
        unique (survey_id, qid)
);

create index assessment_survey_result_questions_created_at_idx
    on assessment_survey_result_questions (created_at);

create index assessment_survey_result_questions_qid_idx
    on assessment_survey_result_questions (qid);

create index assessment_survey_result_questions_value_idx
    on assessment_survey_result_questions (value);
