SELECT g.fiscal_year,SUM(ROUND(m.sold_quantity*g.gross_price)) as total_gp FROM gdb0041.fact_sales_monthly m
JOIN fact_gross_price g
on g.product_code=m.product_code and g.fiscal_year=get_fiscal_year(m.date)
WHERE customer_code=90002002
GROUP BY fiscal_year
ORDER BY date asc;