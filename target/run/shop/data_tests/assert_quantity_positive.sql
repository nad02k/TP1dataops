
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select order_id, quantity
from "warehouse"."main"."orders_clean"
where quantity <= 0
  
  
      
    ) dbt_internal_test