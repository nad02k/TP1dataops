
    

    create  table
      "warehouse"."main"."revenue_by_country__dbt_tmp"
  
    
    as (
      select
    country,
    round(sum(quantity * unit_price), 2) as revenue
from "warehouse"."main"."orders_clean"
group by country
order by country
    );
    
  