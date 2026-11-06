
-- Fixture for stg_orders
select 
    
    cast(1 as INTEGER)
 as "order_id", 
    
    cast('2026-10-05' as DATE)
 as "order_date", 
    
    cast('C001' as character varying)
 as "customer_id", 
    
    cast('Spain' as character varying)
 as "country", cast(null as character varying(256)) as "product", 
    
    cast(1 as INTEGER)
 as "quantity", 
    
    cast(10.0 as DECIMAL(10,2))
 as "unit_price", 
    
    cast(1 as BIGINT)
 as "_row_number", cast(null as TIMESTAMP WITH TIME ZONE) as "_loaded_at"
union all
select 
    
    cast(2 as INTEGER)
 as "order_id", 
    
    cast('2026-10-05' as DATE)
 as "order_date", 
    
    cast('C002' as character varying)
 as "customer_id", 
    
    cast('Italy' as character varying)
 as "country", cast(null as character varying(256)) as "product", 
    
    cast(1 as INTEGER)
 as "quantity", 
    
    cast(10.0 as DECIMAL(10,2))
 as "unit_price", 
    
    cast(2 as BIGINT)
 as "_row_number", cast(null as TIMESTAMP WITH TIME ZONE) as "_loaded_at"