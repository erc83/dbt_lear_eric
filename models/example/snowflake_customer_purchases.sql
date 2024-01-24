with sample_customer AS (
    SELECT *
    FROM {{ source('sample_source_data', 'customer') }}
),

sample_orders AS (
    SELECT *
    FROM {{ source('sample_source_data', 'orders') }}
) 
-- 2da query haciendo un GROUP BY
SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from  sample_customer c
LEFT JOIN sample_orders o
ON c.c_custkey = o.o_custkey

-- group by
--     c.c_custkey,
--     c.c_name,
--     c.c_nationkey

{{ group_by(3) }}

