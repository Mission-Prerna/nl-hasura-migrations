CREATE  INDEX "assessments_udise_comp_idx" on
  "public"."assessments" using btree ("udise", "submitted_at");
