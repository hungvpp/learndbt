{{config(materialized='view')}}

SELECT 
    *
FROM {{source('wide_world_importers','sales__customers')}}
WHERE
    customer_id is not null
