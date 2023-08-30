CREATE OR REPLACE FUNCTION get_visited_school_by_mentors(for_date date)
    RETURNS TABLE
            (
                mentor_id       bigint,
                visited_schools text
            )
    LANGUAGE plpgsql
AS
$$
DECLARE
    start_date      date;
    end_date        date;
    start_timestamp bigint;
    end_timestamp   bigint;
    current_month   int;
    tablename       text;
    quarter         text;
    raw_query       text;
BEGIN
    current_month = date_part('month', for_date);
    start_date = concat(date_part('year', for_date), '-',
                        case when current_month < 10 then '0' else '' end,
                        current_month, '-01 00:00:00');
    end_date = concat(date_part('year', for_date), '-',
                      case when (current_month + 1) < 10 then '0' else '' end,
                      (current_month + 1), '-01 00:00:00');

    start_timestamp = (extract(epoch from start_date) * 1000);
    end_timestamp = (extract(epoch from end_date) * 1000);

    quarter = CASE
                  WHEN current_month BETWEEN 1 AND 3 THEN 'jan_mar'
                  WHEN current_month BETWEEN 4 AND 6 THEN 'apr_jun'
                  WHEN current_month BETWEEN 7 AND 9 THEN 'jul_sep'
                  ELSE 'oct_dec'
        END;

    tablename = format('assessment_visit_results_v2_%s_%s', date_part('year', for_date), quarter);

    raw_query := format('SELECT avr.mentor_id, string_agg(distinct avr.udise::text, '' '') as visited_schools
                 FROM %I avr
                 WHERE avr.submission_timestamp > %s
                   AND avr.submission_timestamp < %s
                   AND avr.udise > 0
                 GROUP BY avr.mentor_id', tablename, start_timestamp, end_timestamp);

    RETURN QUERY EXECUTE raw_query;
END;
$$;
