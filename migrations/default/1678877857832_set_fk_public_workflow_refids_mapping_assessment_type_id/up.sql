alter table "public"."workflow_refids_mapping"
  add constraint "workflow_refids_mapping_assessment_type_id_fkey"
  foreign key ("assessment_type_id")
  references "public"."assessment_types"
  ("id") on update cascade on delete restrict;
