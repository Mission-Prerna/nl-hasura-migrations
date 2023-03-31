alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_actor_id_fkey"
  foreign key ("actor_id")
  references "public"."actors"
  ("id") on update cascade on delete restrict;
