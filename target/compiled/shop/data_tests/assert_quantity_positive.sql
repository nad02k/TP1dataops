select order_id, quantity
from "warehouse"."main"."orders_clean"
where quantity <= 0