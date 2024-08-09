alter table "public"."assessments" add column "player_results" jsonb
 null default jsonb_build_object();
