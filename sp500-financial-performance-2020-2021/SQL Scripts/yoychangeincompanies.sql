
WITH Growth
AS
(
	SELECT
		date,
		firm,
		[Total Revenue], 
		LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date) AS Last_year,
		ROUND([Total Revenue] - LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date), 2) AS YOY_Difference,
		ROUND(
			(([Total Revenue] - LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date))
			/ NULLIF(LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date), 0)
			) * 100,
			2
		) AS YOY_Revenue_Growth
	FROM
		FinancialData
)
SELECT TOP 10
	G.date,
	G.firm,
	G.Last_year,
	G.[Total Revenue],
	G.YOY_Difference,
	G.YOY_Revenue_Growth
FROM
	Growth AS G
WHERE
	date = (
			SELECT
				MAX(date)
			FROM
				FinancialData AS F2
			WHERE
				f2.firm = g.firm
			)
ORDER BY
	YOY_Revenue_Growth DESC