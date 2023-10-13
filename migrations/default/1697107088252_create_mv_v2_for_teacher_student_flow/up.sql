CREATE MATERIALIZED VIEW "public"."assessment_result_nl_temp_v2" AS
SELECT
  CASE
    WHEN (results.udise IS NULL) THEN d2.name
    ELSE d.name
  END AS district_d,
  CASE
    WHEN (results.udise IS NULL) THEN b2.name
    ELSE b.name
  END AS block_b,
  results.udise,
  results.grade,
  results.student_id,
  CASE
    WHEN (results.actor_id = 1) THEN 'mentor' :: text
    WHEN (results.actor_id = 2) THEN 'examiner' :: text
    WHEN (results.actor_id = 3) THEN 'teacher' :: text
    WHEN (results.actor_id = 4) THEN 'Diet Mentor' :: text
    WHEN (results.actor_id = 5) THEN 'Parent' :: text
    ELSE '' :: text
  END AS actor,
  results.mentor_id,
  date(results.submitted_at) AS created_at,
  count(DISTINCT results.competency_id) AS competencies_assessed,
  count(
    DISTINCT CASE
      WHEN (
        get_nipun_status(results.*, (results.grade) :: integer) = 1
      ) THEN results.competency_id
      ELSE NULL :: integer
    END
  ) AS competencies_achieved,
  CASE
    WHEN (
      count(DISTINCT results.competency_id) = count(
        DISTINCT CASE
          WHEN (
            get_nipun_status(results.*, (results.grade) :: integer) = 1
          ) THEN results.competency_id
          ELSE NULL :: integer
        END
      )
    ) THEN 1
    ELSE 0
  END AS nipun_status,
  CASE
    WHEN (
      (results.grade = 1)
      AND (count(DISTINCT results.competency_id) = 2)
    ) THEN 1
    WHEN (
      (results.grade = 2)
      AND (count(DISTINCT results.competency_id) = 3)
    ) THEN 1
    WHEN (
      (results.grade = 3)
      AND (count(DISTINCT results.competency_id) = 4)
    ) THEN 1
    ELSE 0
  END AS is_complete
FROM
  (
    (
      (
        (
          (
            assessments results
            LEFT JOIN school_list sl ON ((results.udise = sl.udise))
          )
          LEFT JOIN blocks b ON ((b.id = sl.block_id))
        )
        LEFT JOIN blocks b2 ON ((b2.id = results.block_id))
      )
      LEFT JOIN districts d2 ON ((d2.id = b2.district_id))
    )
    LEFT JOIN districts d ON ((d.id = sl.district_id))
  )
WHERE
  (
    (results.student_id IS NOT NULL)
    AND (
      (results.student_id) :: text <> ALL (
        (
          ARRAY ['-1'::character varying, '-2'::character varying, '-3'::character varying]
        ) :: text []
      )
    )
  )
GROUP BY
  CASE
    WHEN (results.udise IS NULL) THEN d2.name
    ELSE d.name
  END,
  CASE
    WHEN (results.udise IS NULL) THEN b2.name
    ELSE b.name
  END,
  results.udise,
  results.grade,
  results.student_id,
  results.actor_id,
  results.mentor_id,
  (date(results.submitted_at));
  
CREATE MATERIALIZED VIEW "public"."assessment_result_nl_dashboard_v2" AS
SELECT
  assessment_result_nl_temp_v2.district_d AS district,
  assessment_result_nl_temp_v2.block_b AS block,
  assessment_result_nl_temp_v2.udise,
  assessment_result_nl_temp_v2.grade,
  assessment_result_nl_temp_v2.student_id,
  assessment_result_nl_temp_v2.actor,
  assessment_result_nl_temp_v2.mentor_id,
  assessment_result_nl_temp_v2.created_at,
  assessment_result_nl_temp_v2.competencies_assessed,
  assessment_result_nl_temp_v2.competencies_achieved,
  assessment_result_nl_temp_v2.nipun_status,
  assessment_result_nl_temp_v2.is_complete
FROM
  assessment_result_nl_temp_v2;
