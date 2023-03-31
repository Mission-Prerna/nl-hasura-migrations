alter table "public"."assessment_visit_results_v2"
  add constraint "assessment_visit_results_v2_block_id_fkey"
  foreign key ("block_id")
  references "public"."blocks"
  ("id") on update cascade on delete restrict;
