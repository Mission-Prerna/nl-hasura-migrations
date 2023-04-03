alter table "public"."school_list"
  add constraint "school_list_nyay_panchayat_id_fkey2"
  foreign key ("nyay_panchayat_id")
  references "public"."nyay_panchayats"
  ("id") on update cascade on delete restrict;
