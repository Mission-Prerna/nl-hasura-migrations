alter table "public"."nyay_panchayats" drop constraint "nyay_panchayats_name_district_id_block_id_key";
alter table "public"."nyay_panchayats" add constraint "nyay_panchayats_name_key" unique ("name");
