select
    country,
    round(sum(quantity * unit_price), 2) as revenue
from "warehouse"."main"."orders_clean"
group by country
order by country