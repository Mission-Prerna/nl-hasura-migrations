update mentor AS m
set district_id = d.id
from districts d
where d.name = m.district_name;
