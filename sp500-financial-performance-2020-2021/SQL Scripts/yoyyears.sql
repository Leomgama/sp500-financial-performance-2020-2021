


WITH YearlyTotal
AS
(
	SELECT
		DATEPART(YEAR, date) AS 'YEAR',
		SUM([Total Revenue]) AS Revenue_Total,
		SUM([Gross Profit]) AS Total_Gross_Profit,
		SUM([Net Income]) AS Total_Net_Income
	FROM
		FinancialData
	GROUP BY
		DATEPART(YEAR, date)
)
SELECT
	YEAR,
	Revenue_Total,
	Total_Gross_Profit,
	Total_Net_Income,
	ROUND(Revenue_Total - LAG(Revenue_Total) OVER(ORDER BY YEAR), 2) AS Revenue_Change,
	ROUND(Total_Gross_Profit - LAG(Total_Gross_Profit) OVER(ORDER BY YEAR), 2) AS Gross_Profit_Change,
	ROUND(Total_Net_Income - LAG(Total_Net_Income) OVER(ORDER BY YEAR), 2) AS Net_Income_Change
FROM
	YearlyTotal