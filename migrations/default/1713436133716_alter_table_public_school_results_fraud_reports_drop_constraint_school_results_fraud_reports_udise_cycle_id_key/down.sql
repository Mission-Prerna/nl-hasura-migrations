alter table "public"."school_results_fraud_reports" add constraint "school_results_fraud_reports_cycle_id_udise_key" unique ("cycle_id", "udise");
