alter table "public"."cache_mentor_metrics_monthly" add constraint "cache_mentor_metrics_monthly_type_value_type_mentor_id_key" unique ("type_value", "type", "mentor_id");
