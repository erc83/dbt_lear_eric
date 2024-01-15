

## creando inicialmente 
```sql
-- 2da query haciendo un GROUP BY esta query se hace en snowflake  y se trae aca
SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
ON c.c_custkey = o.o_custkey

group by
    c.c_custkey,
    c.c_name,
    c.c_nationkey

```


#### agregando la materializacion
```sql

{{ config(materialized='table') }} -- se agrega esta linea

SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
ON c.c_custkey = o.o_custkey

group by
    c.c_custkey,
    c.c_name,
    c.c_nationkey

```



## lear_dbt_eric/models/example/schema.yml   ->  modificacion en este archivo para que se cargue en la data


```yml
  - name: snowflake_customer_purchases
    description: "the total purchases for each customer in snowflake sample data"
    columns:
      - name: c_custkey
        tests: 
          - unique
          - not_null
```




