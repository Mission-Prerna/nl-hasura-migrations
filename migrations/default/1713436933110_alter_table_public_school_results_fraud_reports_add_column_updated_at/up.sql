alter table "public"."school_results_fraud_reports" add column "updated_at" time
 not null default now();
