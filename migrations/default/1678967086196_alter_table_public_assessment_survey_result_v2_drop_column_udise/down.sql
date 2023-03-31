comment on column "public"."assessment_survey_result_v2"."udise" is E'V2 for assessment_survey_result table';
alter table "public"."assessment_survey_result_v2" alter column "udise" drop not null;
alter table "public"."assessment_survey_result_v2" add column "udise" bpchar;
