{{ config(materialized="view") }}

SELECT distinct
  o_orderdate,
  SUM(totalprice) OVER (ORDER BY o_orderdate) AS cumulative_sales

FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"

ORDER BY o_orderdate
