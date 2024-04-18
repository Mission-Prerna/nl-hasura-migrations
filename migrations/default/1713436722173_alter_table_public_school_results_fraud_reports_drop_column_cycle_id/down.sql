alter table "public"."school_results_fraud_reports"
  add constraint "school_results_fraud_reports_cycle_id_fkey"
  foreign key (cycle_id)
  references "public"."assessment_cycles"
  (id) on update restrict on delete restrict;
alter table "public"."school_results_fraud_reports" alter column "cycle_id" drop not null;
alter table "public"."school_results_fraud_reports" add column "cycle_id" int4;
