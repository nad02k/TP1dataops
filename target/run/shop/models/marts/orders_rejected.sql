
    

    create  table
      "warehouse"."main"."orders_rejected__dbt_tmp"
  
    
    as (
      select *
from "warehouse"."main"."int_orders_checked"
where reject_reason is not null
    );
    
  