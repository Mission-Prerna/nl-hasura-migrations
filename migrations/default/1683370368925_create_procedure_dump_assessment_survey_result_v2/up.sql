-- dumping records into dump_assessment_survey_result_v2 table
create or replace procedure dump_assessment_survey_result_v2(
    from_id bigint,
    to_id bigint
)
    language plpgsql
as
$$
declare row record;
        result_json jsonb;
begin
    insert into assessment_survey_result_v2(id, mentor_id, grade, subject_id, actor_id, created_at, udise,
                                            submission_timestamp, app_version_code, v)
    select assessment_survey_result.id,
           m.id,
           grade,
           case
               when subject = 'Hindi' then 2
               when subject = 'hindi' then 2
               when subject = 'Math' then 1
               when subject = 'math' then 1
               when subject = 'Maths' then 1
               when subject = 'maths' then 1
               when subject = 'English' then 3
               when subject = 'english' then 3
               else 0
               end as subject_id,
           case
               when actor = 'teacher' then 3
               when actor = 'mentor' then 1
               when actor = 'examiner' then 2
               else 0
               end as actor_id,
           created_at,
           case
               when school_udise = 0 then null
               else school_udise
               end as udise,
           assessment_survey_result.id as submission_timestamp,
           0 as app_version_code,
           1 as v
    from assessment_survey_result
             left join mentor m
                       on m.id = assessment_survey_result.username::bigint and assessment_survey_result.username != ''
    where assessment_survey_result.id >= from_id
      and assessment_survey_result.id < to_id;

    for row in select * from assessment_survey_result where id >= from_id and id < to_id
        loop
            --         raise notice 'Arr: %', row.results::jsonb->'results';
            for result_json in (select * from jsonb_array_elements(row.results::jsonb->'results'))
                loop
                    --                     raise notice 'Record ID: %, Json: %', row.id, result_json;
                    insert into assessment_survey_result_questions(survey_id, qid, value, created_at)
                    values (
                               row.id,
                               result_json->>'qId',
                               result_json->>'value',
                               row.created_at
                           );
                end loop;
        end loop;

    commit;
end;
$$;
