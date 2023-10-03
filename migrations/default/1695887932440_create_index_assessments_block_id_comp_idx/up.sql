CREATE  INDEX "assessments_block_id_comp_idx" on
  "public"."assessments" using btree ("block_id", "submitted_at");
