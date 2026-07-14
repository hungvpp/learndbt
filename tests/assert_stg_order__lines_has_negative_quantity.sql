SELECT 
    order_line_id,
    sum(quantity) as total_quantity
FROM 
    {{ref('stg_order__lines')}}
group by order_line_id
having total_quantity < 0