alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_subject_id_fkey"
  foreign key ("subject_id")
  references "public"."subjects"
  ("id") on update cascade on delete restrict;
