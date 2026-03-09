WITH cte1 as(
SELECT *,
    row_number() over(partition by category order by amount) as rn,
    rank() over(partition by category order by amount) as rnk,
    dense_rank() over(partition by category order by amount) as drnk
FROM random_tables.expenses
) 
SELECT * from cte1 WHERE rn<=3