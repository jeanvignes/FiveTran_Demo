
-- Use the `ref` function to select from other models

select *
from {{ ref('Series_T2_001_calendar_subset_w_join_to_BV_ORDERS') }}

--where id = 1
