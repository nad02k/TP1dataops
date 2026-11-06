
    

    create  table
      "warehouse"."main"."orders_clean__dbt_tmp"
  
    
    as (
      select * exclude (reject_reason)
from "warehouse"."main"."int_orders_checked"
where reject_reason is null
    );
    
  