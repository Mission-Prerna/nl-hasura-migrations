alter table "public"."workflow_refids_mapping"
  add constraint "workflow_refids_mapping_subject_id_fkey"
  foreign key ("subject_id")
  references "public"."subjects"
  ("id") on update cascade on delete restrict;
