
-- Use the `ref` function to select from other models


select *
from {{ ref('my_third_dbt_model') }};

select *
from {{ ref('Change_CALENDAR_SUBSET6_dbt_model') }}
