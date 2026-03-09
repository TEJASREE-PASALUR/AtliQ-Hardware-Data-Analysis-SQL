SELECT * FROM gdb0041.fact_sales_monthly;
SELECT 
     m.date,g.fiscal_year,m.product_code,p.product,p.variant,m.sold_quantity,g.gross_price,
	 ROUND(m.sold_quantity*g.gross_price,2) as total_gross_price
FROM fact_sales_monthly m 
JOIN dim_product p on m.product_code=p.product_code 
JOIN fact_gross_price g on g.product_code=m.product_code AND g.fiscal_year=get_fiscal_year(m.date)
WHERE customer_code=90002002 and get_fiscal_year(date)=2021
ORDER BY date asc
LIMIT 10000