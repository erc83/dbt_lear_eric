In this assignment, you will create a new transformation called cumulative_orders_by_date. The transformation should be built off of the "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" table. The goal of the query is to get the cumulative sales for the order date. For example, if the sales were $10 on January 1 and $25 on January 3, then the cumulative sales would be $10 and $35 for Jan 1 and Jan 3 respectively. HINT: If you need help with the actual query, take a look at https://docs.snowflake.com/en/sql-reference/functions-analytic.html

Once you've tested your query works as you expected in Snowflake, add it as a new file in the models folder, add it to the schema.yml file, and run dbt run. For this assignment, we'd like the transformation to be a materialized table, so take a look at the previous lesson if you need a refreshed on how to do that.



Once you've successfully run and deployed your transformation, check that it is in snowflake by running:



SELECT * FROM dbt.cumulative_orders_by_date.

Preguntas de esta tarea
Create the transformation outlined in the instructions