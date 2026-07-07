{{config('materialized','table')}}

select 
    c.customer_id,
    c.customer_name,
    count(o.order_id) as total_orders,
    sum(ol.quantity) as total_items
from {{ref('stg_customers')}} as c
left join {{ref('stg_orders')}} as o
    on c.customer_id = o.customer_id
left join {{ref('stg_order__lines')}} as ol
    on o.order_id = ol.order_id
group by c.customer_id, c.customer_name