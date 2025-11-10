




WITH CompanyRevenue
AS
(
	SELECT
		firm,
		SUM([Total Revenue]) AS Revenue_total
	FROM
		FinancialData
	GROUP BY
		firm
)
SELECT TOP 10
	RANK() OVER(ORDER BY Revenue_total DESC) AS 'Rank1',
	firm,
	Revenue_total
FROM
	CompanyRevenue
ORDER BY
	RANK1
