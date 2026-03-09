SELECT m.date,SUM(ROUND(m.sold_quantity*p.gross_price,2)) as total_gp
FROM gdb0041.fact_sales_monthly m
JOIN fact_gross_price p
on m.product_code=p.product_code and p.fiscal_year=get_fiscal_year(m.date)
WHERE customer_code=90002002 
GROUP BY (date)
ORDER BY (m.date) asc ;