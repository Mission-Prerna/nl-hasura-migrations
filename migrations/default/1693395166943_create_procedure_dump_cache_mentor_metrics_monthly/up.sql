create or replace procedure dump_cache_mentor_metrics_monthly(
    for_date date
)
    language plpgsql
as
$$
declare
    start_date         date;
    end_date           date;
    start_timestamp    bigint;
    end_timestamp      bigint;
    table_month        int;
    current_month      int;
    tablename_v2       text;
    tablename_students text;
    quarter            text;
    raw_query          text;
begin
    current_month = date_part('month', for_date); -- current month
    start_date = concat(date_part('year', for_date), '-',
                        case when current_month < 10 then '0' else '' end,
                        current_month, '-01 00:00:00'); -- current month's start date
    -- raise notice 'Start date: %', start_date;

    end_date = concat(date_part('year', for_date), '-',
                      case when (current_month + 1) < 10 then '0' else '' end,
                      (current_month + 1), '-01 00:00:00'); -- next month's start date
    -- raise notice 'End date: %', end_date;

    start_timestamp = (extract(epoch from start_date) * 1000); -- current month's start timestamp in milli seconds
    end_timestamp = (extract(epoch from end_date) * 1000); -- next month's start timestamp in milli seconds
    -- raise notice 'Start timestamp: %', start_timestamp;
    -- raise notice 'End timestamp: %', end_timestamp;

    table_month = concat(date_part('year', for_date),
                         case when current_month < 10 then '0' else '' end,
                         current_month)::int; -- month value to be inserted into the table
    -- raise notice 'Current Month: %', table_month;

    quarter = case
                  when current_month = 1 then 'jan_mar'
                  when current_month = 2 then 'jan_mar'
                  when current_month = 3 then 'jan_mar'
                  when current_month = 4 then 'apr_jun'
                  when current_month = 5 then 'apr_jun'
                  when current_month = 6 then 'apr_jun'
                  when current_month = 7 then 'jul_sep'
                  when current_month = 8 then 'jul_sep'
                  when current_month = 9 then 'jul_sep'
                  when current_month = 10 then 'oct_dec'
                  when current_month = 11 then 'oct_dec'
                  when current_month = 12 then 'oct_dec'
        end;

    tablename_v2 = concat('assessment_visit_results_v2_', date_part('year', for_date), '_', quarter);
    tablename_students = concat('assessment_visit_results_students_', date_part('year', for_date), '_', quarter);
    -- raise notice 'TableName V2: %', tablename_v2;
    -- raise notice 'TableName Students: %', tablename_students;

    raw_query = FORMAT('' ||
        'insert into
           cache_mentor_metrics_monthly(mentor_id, month, schools_visited, assessments_taken, avg_time,
                                        grade_1_assessments, grade_2_assessments, grade_3_assessments,
                                        created_at,
                                        updated_at)
           select t.mentor_id,
           $5,
           t.schools_visited,
           t.assessments_taken,
           t.avg_time,
           t.grade_1_assessments,
           t.grade_2_assessments,
           t.grade_3_assessments,
           now(),
           now()
           from (
               select mentor.id                                                              as mentor_id,
                      (select count(DISTINCT udise)
                       from $1 as avr2
                       where avr2.mentor_id = mentor.id
                         and avr2.udise > 0
                         and avr2.submission_timestamp > $3
                         and avr2.submission_timestamp < $4)                      as schools_visited,
                      COALESCE(AVG(avrs.total_time_taken), 0) :: int8                        AS avg_time,
                      COUNT(DISTINCT avrs.student_session)                                   AS assessments_taken,
                      COUNT(DISTINCT CASE WHEN avrs.grade = 1 THEN avrs.student_session END) AS grade_1_assessments,
                      COUNT(DISTINCT CASE WHEN avrs.grade = 2 THEN avrs.student_session END) AS grade_2_assessments,
                      COUNT(DISTINCT CASE WHEN avrs.grade = 3 THEN avrs.student_session END) AS grade_3_assessments
               from mentor
                        join $2 AS avrs
                             on (avrs.mentor_id = mentor.id and
                                 avrs.submission_timestamp > $3 and
                                 avrs.submission_timestamp < $4)
               group by mentor.id
           ) t
           on conflict(mentor_id, month) do update
           set(schools_visited, assessments_taken, avg_time, grade_1_assessments,
               grade_2_assessments, grade_3_assessments, updated_at)
               = (excluded.schools_visited, excluded.assessments_taken,
                  excluded.avg_time, excluded.grade_1_assessments,
                  excluded.grade_2_assessments, excluded.grade_3_assessments,
                  excluded.updated_at);
        ');

    raw_query = replace(raw_query, '$1', tablename_v2);
    raw_query = replace(raw_query, '$2', tablename_students);
    raw_query = replace(raw_query, '$3', start_timestamp::text);
    raw_query = replace(raw_query, '$4', end_timestamp::text);
    raw_query = replace(raw_query, '$5', table_month::text);
    -- raise notice '%', raw_query;
    EXECUTE raw_query;
    commit;
end;
$$;
