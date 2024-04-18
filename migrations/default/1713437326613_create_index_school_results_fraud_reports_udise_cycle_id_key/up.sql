CREATE  INDEX "school_results_fraud_reports_udise_cycle_id_key" on
  "public"."school_results_fraud_reports" using btree ("udise", "cycle_id");
