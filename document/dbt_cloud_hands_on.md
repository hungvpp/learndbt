# Create folder structure under models folder

Create 2 folders staging and marts under models

![alt text](image.png)

# Create staging models
## Create a _source.yaml file
Under staging folder, create a _source.yaml file the contain information about data source as following:
```yml
version: 2

sources:
  - name: wide_world_importers
    database: gcp-data-eng-499102
    dataset: wide_world_importers
    tables: 
      - name: sales__customers
```

## Create a new customer model
Under staging folder, create a new stg_customer.sql file
```sql
{{config(materialized='view')}}

SELECT 
    *
FROM {{source('wide_world_importers','sales__customers')}}
WHERE
    customer_id is not null
```

## Create a test for customer model
Under staging folder, create a new stg_customers.yaml
```yml
  models:
    - name: stg_customers
      columns:
        - name: customer_id
          data_tests:
            - unique
            - not_null
```

then, run dbt command
```
dbt build --select stg_customers.sql
```