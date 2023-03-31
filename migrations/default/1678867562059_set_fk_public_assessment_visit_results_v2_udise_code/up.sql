alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_udise_code_fkey"
  foreign key ("udise_code")
  references "public"."school_list"
  ("udise_code") on update cascade on delete restrict;
