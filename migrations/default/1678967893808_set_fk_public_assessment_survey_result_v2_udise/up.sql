alter table "public"."assessment_survey_result_v2"
  add constraint "assessment_survey_result_v2_udise_fkey"
  foreign key ("udise")
  references "public"."school_list"
  ("udise") on update cascade on delete restrict;
