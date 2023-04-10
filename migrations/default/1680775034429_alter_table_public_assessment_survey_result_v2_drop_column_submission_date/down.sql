comment on column "public"."assessment_survey_result_v2"."submission_date" is E'V2 for assessment_survey_result table';
alter table "public"."assessment_survey_result_v2" alter column "submission_date" drop not null;
alter table "public"."assessment_survey_result_v2" add column "submission_date" date;
