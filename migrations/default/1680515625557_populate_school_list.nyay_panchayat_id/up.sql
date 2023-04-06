update school_list AS s
set nyay_panchayat_id = n.id
from nyay_panchayats n
where lower(trim(from n.name)) = lower(trim (from s.nypanchayat)) and s.district_id = n.district_id and s.block_id = n.block_id;
