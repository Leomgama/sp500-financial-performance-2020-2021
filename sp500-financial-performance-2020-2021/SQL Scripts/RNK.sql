




WITH CompanyRevenue
AS
(
	SELECT
		firm,
		SUM([Total Revenue]) AS Total_Revenue_Both_Years
	FROM
		FinancialData
	GROUP BY
		firm
)
SELECT TOP 10
	RANK() OVER(ORDER BY Total_Revenue_Both_Years DESC) AS RNK,
	firm,
	Total_Revenue_Both_Years
FROM
	CompanyRevenue
ORDER BY
	RNK