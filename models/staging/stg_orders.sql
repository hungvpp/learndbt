{{config('materialzed','view')}}

SELECT * 
FROM {{source('wide_world_importers','sales__orders')}}
WHERE
    order_id is not NULL  
