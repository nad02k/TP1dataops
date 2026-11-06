
    
    

select
    country as unique_field,
    count(*) as n_records

from "warehouse"."main"."revenue_by_country"
where country is not null
group by country
having count(*) > 1


