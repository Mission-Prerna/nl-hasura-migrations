alter table "public"."school_list"
  add constraint "school_list_block_id_fkey"
  foreign key ("block_id")
  references "public"."blocks"
  ("id") on update cascade on delete restrict;
