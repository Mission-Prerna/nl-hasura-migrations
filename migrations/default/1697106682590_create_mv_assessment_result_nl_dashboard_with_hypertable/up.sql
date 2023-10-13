create materialized view assessment_result_nl_temp_new as
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
       results.student_session,
       CASE
           WHEN results.actor_id = 1 THEN 'mentor'::text
           WHEN results.actor_id = 2 THEN 'examiner'::text
           WHEN results.actor_id = 3 THEN 'teacher'::text
           WHEN results.actor_id = 4 THEN 'Diet Mentor'::text
           WHEN results.actor_id = 5 THEN 'Parent'::text
           ELSE ''::text
           END                                AS actor,
       results.mentor_id,
       date(CASE WHEN results.app_version_code = 0 then results.created_at else results.submitted_at end)               AS created_at_1,
       count(DISTINCT results.competency_id) AS competencies_assessed,
       count(DISTINCT
             CASE
                 WHEN get_nipun_status(results, results.grade::integer) = 1 THEN results.competency_id
                 ELSE NULL::integer
                 END)                                             AS competencies_achieved,
       CASE
           WHEN count(DISTINCT results.competency_id) = count(DISTINCT
                                                               CASE
                                                                   WHEN get_nipun_status(results, results.grade::integer) = 1
                                                                       THEN results.competency_id
                                                                   ELSE NULL::integer
                                                                   END) THEN 1
           ELSE 0
           END                                                    AS nipun_status,
       CASE
           WHEN results.grade = 1 AND count(DISTINCT results.competency_id) = 2 THEN 1
           WHEN results.grade = 2 AND count(DISTINCT results.competency_id) = 3 THEN 1
           WHEN results.grade = 3 AND count(DISTINCT results.competency_id) = 4 THEN 1
           ELSE 0
           END                                AS is_complete
FROM assessments results
         LEFT JOIN school_list sl ON results.udise = sl.udise
         LEFT JOIN blocks b ON b.id = sl.block_id
         LEFT JOIN blocks b2 ON b2.id = results.block_id
         LEFT JOIN districts d2 ON d2.id = b2.district_id
         LEFT JOIN districts d ON d.id = sl.district_id
WHERE student_id is null
GROUP BY district_d, block_b, results.udise, results.grade, results.student_session, results.actor_id, results.mentor_id,
         created_at_1;

create materialized view assessment_result_nl_dashboard_new as
select district_d as district,
       block_b as block,
       udise,
       grade,
       student_session,
       actor,
       mentor_id,
       created_at_1 as created_at,
       competencies_assessed,
       competencies_achieved,
       nipun_status,
       is_complete
from assessment_result_nl_temp_new;