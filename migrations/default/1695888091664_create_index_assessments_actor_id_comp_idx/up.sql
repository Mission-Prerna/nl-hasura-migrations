CREATE  INDEX "assessments_actor_id_comp_idx" on
  "public"."assessments" using btree ("actor_id", "submitted_at");
