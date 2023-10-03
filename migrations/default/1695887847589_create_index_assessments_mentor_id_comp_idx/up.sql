CREATE  INDEX "assessments_mentor_id_comp_idx" on
  "public"."assessments" using btree ("mentor_id", "submitted_at");
