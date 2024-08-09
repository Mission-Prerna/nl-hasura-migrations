alter table "public"."school_results_fraud_reports" alter column "created_at" set default now();
alter table "public"."school_results_fraud_reports" alter column "created_at" drop not null;
alter table "public"."school_results_fraud_reports" add column "created_at" timetz;
