update school_list AS s
set district_id = d.id
from districts d
where d.name = s.district;
