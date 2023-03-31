alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_mentor_id_fkey"
  foreign key ("mentor_id")
  references "public"."mentor"
  ("id") on update cascade on delete cascade;
