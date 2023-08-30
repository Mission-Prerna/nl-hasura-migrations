comment on column "public"."cache_mentor_metrics_monthly"."type_value" is E'This table will hold assessment count metrics againts each mentor for home screen overview';
alter table "public"."cache_mentor_metrics_monthly" alter column "type_value" drop not null;
alter table "public"."cache_mentor_metrics_monthly" add column "type_value" varchar;
