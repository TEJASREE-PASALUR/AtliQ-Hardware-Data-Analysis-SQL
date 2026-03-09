WITH cte1 as(
    SELECT c.customer,c.region,ROUND(SUM(ns.net_sales)/1000000,2) as NS_mln
    FROM gdb0041.net_sales ns
    JOIN dim_customer c
    ON c.market=ns.market and c.customer_code=ns.customer_code
    WHERE fiscal_year=2021 
    GROUP BY c.customer,c.region
)
SELECT *,NS_mln*100/SUM(NS_mln) over(partition by region) as pct_share FROM cte1
ORDER BY region,NS_mln DESC 