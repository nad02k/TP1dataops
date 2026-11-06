
    
    

with all_values as (

    select
        country as value_field,
        count(*) as n_records

    from "warehouse"."main"."orders_clean"
    group by country

)

select *
from all_values
where value_field not in (
    'France','Germany','Italy','Morocco','Tunisia'
)


