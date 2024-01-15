
-- la key unica sera el date
{{ config(materialized='incremental', unique_key = 'd_date' )}}

SELECT *
FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.DATE_DIM
WHERE d_date <= current_date

-- 2.- creamos la macro para que no se dupliquen 

{% if is_incremental() %}
    and d_date > (select max(d_date) from {{ this }})  -- this hace referencia a la tabla destino
{% endif %}


