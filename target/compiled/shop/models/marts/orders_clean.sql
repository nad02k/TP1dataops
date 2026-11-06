select * exclude (reject_reason)
from "warehouse"."main"."int_orders_checked"
where reject_reason is null