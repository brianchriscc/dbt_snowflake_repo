{{config(materialized='table') }}

WITH brian_cte AS (
    SELECT * FROM {{source('BRIAN_DB','brian_chris')}}
)

SELECT *,SUM(Amount) AS Total_sum FROM brian_cte
WHERE YEAR(TRANSACTION_DATE) = 2025
GROUP BY CURRENCY,TRANSACTION_ID,TRANSACTION_DATE,ACCOUNT_ID,AMOUNT,CATEGORY,DESCRIPTION



