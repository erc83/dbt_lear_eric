

## lear_dbt_eric/models/example/cumulative_orders_by_date.sql    ->  ejercicio de la tarea

```sql
with orders as (
    SELECT *
    FROM {{source('sample', 'orders')}}
)

select distinct
    o_orderdate,
    sum(o_totalprice) over (order by o_orderdate) as cumulative_sales

from orders

{% if target.name == 'dev' %}
where year(o_orderdate) = 1996
{% endif %}

order_by o_orderdate
```


## lear_dbt_eric/models/example/schema.yml          ->  archivo donde se modifica como se tiene que leer 
```yml

version: 2

models:

    - name: cumulative_orders_by_date

## buscar data de una tabla
sources:
    - name: sample
      database: snowflake_sample_data   # Tell dbt to look for the source in the "raw" database
      schema: tpch_sf1
      tables:
        - name: customer
          columns:
            - name: c_custkey
              tests:
                - unique
                - not_null
        - name: orders
    - name: sample2
      database: snowflake_sample_data
      schema: tpch_sf1
      tables:
        - name: customer
```


## para que funcione el group_by utilizamos una macro

#### lear_dbt_eric/macros/group_by.sql

```sql
{% macro group_by(n) %}
    GROUP BY
        {% for i in range(1, n + 1) %} 
            {{ i }}
            {% if not loop.last %} , {% endif %}
        {% endfor %}
{% endmacro %}
```
