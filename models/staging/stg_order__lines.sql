{{config('materialized','view')}}

with 

source as (

    select * from {{ source('wide_world_importers', 'sales__order_lines') }}

),

renamed as (

    select
        order_line_id,
        order_id,
        stock_item_id,
        description,
        package_type_id,
        quantity,
        unit_price,
        tax_rate,
        picked_quantity,
        picking_completed_when,
        last_edited_by,
        last_edited_when

    from source

)

select * from renamed