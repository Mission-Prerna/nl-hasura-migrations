alter table "public"."mentor"
  add constraint "mentor_block_id_fkey"
  foreign key ("block_id")
  references "public"."blocks"
  ("id") on update cascade on delete restrict;
