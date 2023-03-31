alter table "public"."assessment_visit_results_v2" drop constraint "assessment_visit_results_v2_assessment_type_id_fkey",
  add constraint "assessment_visit_results_v2_udise_fkey2"
  foreign key ("udise")
  references "public"."school_list"
  ("udise") on update cascade on delete restrict;
