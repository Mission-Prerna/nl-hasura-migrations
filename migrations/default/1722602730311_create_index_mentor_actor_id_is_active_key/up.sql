CREATE  INDEX "mentor_actor_id_is_active_key" on
  "public"."mentor" using btree ("actor_id", "is_active");
