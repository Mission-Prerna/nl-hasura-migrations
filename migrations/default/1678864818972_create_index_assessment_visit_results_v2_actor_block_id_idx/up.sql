CREATE  INDEX "assessment_visit_results_v2_actor_block_id_idx" on
  "public"."assessment_visit_results_v2" using btree ("actor_id", "block_id");
