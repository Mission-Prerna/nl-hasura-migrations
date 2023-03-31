CREATE  INDEX "sch_list_block_id_dist_id_index" on
  "public"."school_list" using btree ("district_id", "block_id");
