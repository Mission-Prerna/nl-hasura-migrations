update mentor AS m
set designation_id = d.id
from designations d
where lower(d.name) = lower(m.designation);
