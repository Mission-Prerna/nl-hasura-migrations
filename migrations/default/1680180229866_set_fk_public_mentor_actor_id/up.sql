alter table "public"."mentor"
  add constraint "mentor_actor_id_fkey"
  foreign key ("actor_id")
  references "public"."actors"
  ("id") on update cascade on delete restrict;
