




WITH Growth
AS
(
	SELECT
		date,
		firm,
		[Total Revenue],
		LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date) AS PREVIOUS_YEAR_TOTALREVENUE,
		ROUND(
			(([Total Revenue] - LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date))
			/ NULLIF(LAG([Total Revenue]) OVER (PARTITION BY firm ORDER BY date), 0)
			) * 100,
			2
		) AS YOY_GROWTH_PERCENT
	FROM
		FinancialData
)
SELECT TOP 5
	*
FROM 
	Growth AS G
WHERE
	date = (
			SELECT	
				MAX(date)
			FROM
				FinancialData AS F2
			WHERE
				F2.firm = g.firm
			)
ORDER BY
	YOY_GROWTH_PERCENT DESC