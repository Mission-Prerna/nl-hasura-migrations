alter table "public"."nyay_panchayats" drop constraint "nyay_panchayats_name_key";
alter table "public"."nyay_panchayats" add constraint "nyay_panchayats_name_district_id_block_id_key" unique ("name", "district_id", "block_id");
