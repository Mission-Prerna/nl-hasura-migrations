alter table "public"."assessments"
  add constraint "assessments_actor_id_fkey"
  foreign key ("actor_id")
  references "public"."actors"
  ("id") on update cascade on delete restrict;
