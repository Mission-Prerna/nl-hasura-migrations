alter table "public"."assessments"
  add constraint "assessments_block_id_fkey"
  foreign key ("block_id")
  references "public"."blocks"
  ("id") on update cascade on delete restrict;
