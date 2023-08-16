-- Create funtion to get nipun status
CREATE OR REPLACE FUNCTION get_nipun_status (IN input_row record, IN grade int)
    RETURNS integer AS $nipun_status$
declare
    nipun_status integer;
BEGIN
    nipun_status = CASE
                       WHEN
                                   input_row.module = 'odk'
                               AND input_row.total_questions > 0
                               AND ((input_row.achievement * 100) / input_row.total_questions) >= 75
                           THEN 1
                       WHEN
                                   input_row.module = 'bolo'
                               AND (
                                           (grade = 1 AND input_row.achievement >= 45)
                                           OR (grade = 2 AND input_row.achievement >= 60)
                                           OR (grade = 3 AND input_row.achievement >= 75)
                                       )
                           THEN 1
                       ELSE 0
        END;
    RETURN nipun_status;
END
$nipun_status$ LANGUAGE plpgsql;

-- Temp MV
create materialized view IF NOT EXISTS assessment_result_nl_temp as
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2 results
         JOIN assessment_visit_results_students students ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))
UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2023_apr_jun results
         JOIN assessment_visit_results_students_2023_apr_jun students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))
UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2023_jul_sep results
         JOIN assessment_visit_results_students_2023_jul_sep students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2023_oct_dec results
         JOIN assessment_visit_results_students_2023_oct_dec students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2024_jan_mar results
         JOIN assessment_visit_results_students_2024_jan_mar students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2024_apr_jun results
         JOIN assessment_visit_results_students_2024_apr_jun students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2024_jul_sep results
         JOIN assessment_visit_results_students_2024_jul_sep students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2024_oct_dec results
         JOIN assessment_visit_results_students_2024_oct_dec students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

--
UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2025_jan_mar results
         JOIN assessment_visit_results_students_2025_jan_mar students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2025_apr_jun results
         JOIN assessment_visit_results_students_2025_apr_jun students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2025_jul_sep results
         JOIN assessment_visit_results_students_2025_jul_sep students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at))

UNION
SELECT CASE
           WHEN results.udise is null then d2.name
           ELSE d.name
           END AS district_d,
       CASE
           WHEN results.udise is null then b2.name
           ELSE b.name
           END AS block_b,
       results.udise,
       results.grade,
       students.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(results.created_at)               AS created_at,
       count(DISTINCT students.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(students, results.grade::integer) = 1 THEN students.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT students.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(students, results.grade::integer) = 1
                                                                       THEN students.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT students.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT students.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT students.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessment_visit_results_v2_2025_oct_dec results
         JOIN assessment_visit_results_students_2025_oct_dec students
              ON results.id = students.assessment_visit_results_v2_id
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
GROUP BY district_d, block_b, results.udise, results.grade, students.student_session, results.actor_id, results.mentor_id,
         (date(results.created_at));
         
-- Main mv
create materialized view IF NOT EXISTS assessment_result_nl_dashboard as
    select district_d as district,
    block_b as block,
    udise,
    grade,
           student_session,
           actor,
           mentor_id,
           created_at,
           competencies_assessed,
           competencies_achieved,
           nipun_status,
           is_complete
from assessment_result_nl_temp;
