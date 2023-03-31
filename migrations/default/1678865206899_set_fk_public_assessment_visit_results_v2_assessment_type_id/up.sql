alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_assessment_type_id_fkey"
  foreign key ("assessment_type_id")
  references "public"."assessment_types"
  ("id") on update cascade on delete restrict;
