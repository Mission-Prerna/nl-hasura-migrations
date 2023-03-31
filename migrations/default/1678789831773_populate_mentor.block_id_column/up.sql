update mentor AS m
set block_id = b.id
from blocks b
where b.name = m.block_town_name;
