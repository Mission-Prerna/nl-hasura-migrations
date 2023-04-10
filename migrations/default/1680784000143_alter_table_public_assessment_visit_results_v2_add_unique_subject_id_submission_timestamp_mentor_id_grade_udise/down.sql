alter table "public"."assessment_visit_results_v2" drop constraint "assessment_visit_results_v2_subject_id_submission_timestamp_mentor_id_grade_udise_key";
alter table "public"."assessment_visit_results_v2" add constraint "assessment_visit_results_v2_subject_id_submission_timestamp_mentor_id_grade_key" unique ("subject_id", "submission_timestamp", "mentor_id", "grade");
