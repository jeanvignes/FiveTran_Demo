

-- models/my_second_model.sql
--SELECT *
--FROM {{ ref('Series_T1_001_calendar_subset_w_pretty_names') }}


{{ config(materialized='table',
alias = 'CALENDAR_T2'
) }}

with source_data as (


SELECT CAL_T1.PERIOD_MONTH,
CAL_T1.CALENDAR_MONTH,
CAL_T1.YEAR_CALENDAR_MONTH_END,
CAL_T1.BANK_DAY,
BV_ORDERS.COST,
BV_ORDERS.ORDER_DATE,
BV_ORDERS.BRANCH_LOC_NUM

FROM DEV_MATTINGS_SOL_DB.MAT_TRAK_.CALENDAR_T1 CAL_T1

--FROM {{ ref('Series_T1_001_calendar_subset_w_pretty_names') }} CAL_T1

INNER JOIN RM.BASE_VW_RASDETFL_DRAFT BV_ORDERS
    ON TO_DATE(CAL_T1.CALENDAR_MONTH, 'YYYY-MM-DD') = 
        TO_DATE(TO_VARCHAR(BV_ORDERS.ORDER_DATE), 'YYYYMMDD')

WHERE BV_ORDERS.INVOICE_DATE > 0

)

select *
from source_data
