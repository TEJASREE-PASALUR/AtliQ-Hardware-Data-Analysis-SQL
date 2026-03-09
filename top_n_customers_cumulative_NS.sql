with cte1 as (
SELECT c.customer,ROUND(SUM(net_sales)/1000000,2) as NS_mln
FROM gdb0041.net_sales ns
JOIN dim_customer c on c.customer_code=ns.customer_code and ns.market=c.market
WHERE ns.fiscal_year=2021
GROUP BY c.customer
)
SELECT customer, NS_mln*100/SUM(NS_mln) OVER() as pct_share FROM cte1
ORDER BY NS_mln DESC 
;