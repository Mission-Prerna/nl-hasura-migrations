CREATE  INDEX "assessment_cycle_district_school_mapping_cycle_id_udise_idx" on
  "public"."assessment_cycle_district_school_mapping" using btree ("udise", "cycle_id");
