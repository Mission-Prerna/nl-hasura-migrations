alter table "public"."assessment_survey_result_v2" drop constraint "assessment_survey_result_v2_mentor_id_grade_subject_id_submissi";
alter table "public"."assessment_survey_result_v2" add constraint "assessment_survey_result_v2_submission_timestamp_mentor_id_grade_subject_id_key" unique ("submission_timestamp", "mentor_id", "grade", "subject_id");
