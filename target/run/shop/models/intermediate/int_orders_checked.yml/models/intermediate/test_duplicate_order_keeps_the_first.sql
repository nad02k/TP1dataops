
    -- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    "_row_number","reject_reason", 'actual' as "actual_or_expected"
  from (
    with __dbt__cte__stg_orders as (

-- Fixture for stg_orders
select 
    
    cast(1 as INTEGER)
 as "order_id", 
    
    cast('2026-10-05' as DATE)
 as "order_date", 
    
    cast('C001' as character varying)
 as "customer_id", 
    
    cast('Italy' as character varying)
 as "country", cast(null as character varying(256)) as "product", 
    
    cast(1 as INTEGER)
 as "quantity", 
    
    cast(10.0 as DECIMAL(10,2))
 as "unit_price", 
    
    cast(1 as BIGINT)
 as "_row_number", cast(null as TIMESTAMP WITH TIME ZONE) as "_loaded_at"
union all
select 
    
    cast(1 as INTEGER)
 as "order_id", 
    
    cast('2026-10-05' as DATE)
 as "order_date", 
    
    cast('C001' as character varying)
 as "customer_id", 
    
    cast('Italy' as character varying)
 as "country", cast(null as character varying(256)) as "product", 
    
    cast(1 as INTEGER)
 as "quantity", 
    
    cast(10.0 as DECIMAL(10,2))
 as "unit_price", 
    
    cast(2 as BIGINT)
 as "_row_number", cast(null as TIMESTAMP WITH TIME ZONE) as "_loaded_at"
) -- The six quality rules from TP1 and TP2. The first rule that matches wins.
select
    *,
    case
        when customer_id is null                         then 'missing_customer_id'
        when order_date is null                          then 'invalid_date'
        when quantity is null or quantity <= 0           then 'invalid_quantity'
                when unit_price is null
          or unit_price not between 0.01 and 1000
            then 'invalid_unit_price'

        when row_number() over (
            partition by order_id
            order by _row_number
        ) > 1
            then 'duplicate_order_id'

        when country not in (
            'France', 'Germany', 'Italy', 'Morocco', 'Tunisia'
        )
            then 'unknown_country'
    end as reject_reason
from __dbt__cte__stg_orders
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    "_row_number", "reject_reason", 'expected' as "actual_or_expected"
  from (
    select 
    
    cast(2 as BIGINT)
 as "_row_number", 
    
    cast('duplicate_order_id' as character varying)
 as "reject_reason"
union all
select 
    
    cast(1 as BIGINT)
 as "_row_number", 
    
    cast(null as character varying(256))
 as "reject_reason"
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected