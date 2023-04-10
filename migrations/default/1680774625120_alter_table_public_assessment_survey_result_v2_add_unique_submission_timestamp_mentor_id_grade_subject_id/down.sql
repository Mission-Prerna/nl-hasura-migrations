alter table "public"."assessment_survey_result_v2" drop constraint "assessment_survey_result_v2_submission_timestamp_mentor_id_grade_subject_id_key";
alter table "public"."assessment_survey_result_v2" add constraint "assessment_survey_result_v2_submission_date_mentor_id_grade_subject_id_key" unique ("submission_date", "mentor_id", "grade", "subject_id");
