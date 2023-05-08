CREATE OR REPLACE PROCEDURE dump_assessment_visit_results_students(IN from_id bigint, IN to_id bigint)
    LANGUAGE plpgsql
AS $$
declare row              record;
        module_result    jsonb;
        odk_results_data jsonb;
begin
    FOR row IN (SELECT a2.*, a.student_session as student_session, a.total_time_taken as total_time_taken
                FROM assessment_visit_results_v2 a2
                         join assessment_visit_results a on a.id = a2.id
                where a2.id >= from_id
                  and a2.id < to_id)
        LOOP
            --             raise notice 'ROW ID: %', row.id;
            FOR module_result in (select * from jsonb_array_elements(row.module_result))
--                 select competency_id into competency_id from competency_mapping where learning_outcome like module_result->'e';
                loop
                --                     raise notice 'Array: %', module_result;
--                     raise notice 'Array: %', case when (module_result -> 'studentResults' ->> 'competencyId')::integer is null then 0 else (module_result -> 'studentResults' ->> 'competencyId')::integer end;

                    insert into assessment_visit_results_students(student_name, competency_id, module, end_time,
                                                                  is_passed, start_time, statement, achievement,
                                                                  total_questions, success_criteria, session_completed,
                                                                  is_network_active, workflow_ref_id,
                                                                  assessment_visit_results_v2_id, student_session,
                                                                  total_time_taken)
                    values (case
                                when (module_result -> 'studentResults' -> 'studentName')::text is null then ''
                                else (module_result -> 'studentResults' ->> 'studentName')::text
                                end,
                            case
                                when (module_result -> 'studentResults' ->> 'competencyId')::integer is null then 0
                                else (module_result -> 'studentResults' ->> 'competencyId')::integer end,
                            (module_result -> 'studentResults' -> 'moduleResult' ->> 'module')::text,
                            (module_result -> 'studentResults' -> 'moduleResult' -> 'endTime')::bigint,
                            (module_result -> 'studentResults' -> 'moduleResult' -> 'isPassed')::boolean,
                            (module_result -> 'studentResults' -> 'moduleResult' -> 'startTime')::bigint,
                            (module_result -> 'studentResults' -> 'moduleResult' ->> 'statement')::text,
                            (module_result -> 'studentResults' -> 'moduleResult' -> 'achievement')::integer,
                            case
                                when (module_result -> 'studentResults' -> 'moduleResult' -> 'totalQuestions')::integer is null
                                    then 0
                                else (module_result -> 'studentResults' -> 'moduleResult' -> 'totalQuestions')::integer end,
                            (module_result -> 'studentResults' -> 'moduleResult' -> 'successCriteria')::integer,
                            case
                                when (module_result -> 'studentResults' -> 'moduleResult' -> 'sessionCompleted')::boolean is null
                                    then true
                                else (module_result -> 'studentResults' -> 'moduleResult' -> 'sessionCompleted')::boolean end,
                            case
                                when (module_result -> 'studentResults' -> 'moduleResult' -> 'is_network_active')::text is null
                                    then false
                                else (module_result -> 'studentResults' -> 'moduleResult' -> 'is_network_active')::bool end,
                            case
                                when (module_result -> 'studentResults' -> 'workflowRefId')::text is null then ''
                                else (module_result -> 'studentResults' ->> 'workflowRefId')::text end,
                            row.id,
                            row.student_session::uuid,
                            EXTRACT(EPOCH FROM row.total_time_taken::time));
--                     raise notice 'Odk results data: %', module_result->'studentResults'->'odkResultsData';
                    if module_result -> 'studentResults' -> 'odkResultsData' is not null
                    then
                        for odk_results_data in (select *
                                                 from jsonb_array_elements(
                                                                     module_result -> 'studentResults' -> 'odkResultsData' -> 'results'))
                            loop
                                --                                 raise notice 'Odk results data: %', odk_results_data;
                                insert into assessment_visit_results_student_odk_results(question, answer, assessment_visit_results_students_id)
                                values (odk_results_data ->> 'question',
                                        (odk_results_data ->> 'answer')::text,
                                        currval('assessment_visit_results_students_id_seq'));
                            end loop;
                    end if;
                end loop;
        END LOOP;
end;
$$;
