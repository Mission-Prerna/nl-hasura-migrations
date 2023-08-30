alter table "public"."cache_mentor_metrics_monthly" add constraint "cache_mentor_metrics_monthly_mentor_id_month_key" unique ("mentor_id", "month");
