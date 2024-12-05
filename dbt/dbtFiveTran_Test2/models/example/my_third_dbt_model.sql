
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}

{{ config(materialized='table') }}

with source_data as (

SELECT * FROM DEV_MATTINGS_SCHEMA."Calendar4" 
WHERE DEV_MATTINGS_SCHEMA."Calendar4"."Date" BETWEEN '2016-01-01' AND '2016-03-30'

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
