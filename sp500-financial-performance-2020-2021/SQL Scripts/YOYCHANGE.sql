

WITH YearlyTOTAL
AS
(
	SELECT
		DATEPART(YEAR, date) AS YEAR,
		SUM([Total Revenue]) AS total_revenue,
		SUM([Net Income]) AS total_netincome,
		SUM([Gross Profit]) AS total_grossprofit
	FROM
		FinancialData
	GROUP BY
		DATEPART(YEAR, date)
)
SELECT
	YEAR,
	total_revenue,
	total_netincome,
	total_grossprofit,
	ROUND(total_revenue - LAG(total_revenue) OVER (ORDER BY YEAR), 2) AS REVENUE_CHANGE,
	ROUND(total_netincome - LAG(total_netincome) OVER (ORDER BY YEAR), 2) AS NETINCOME_CHANGE,
	ROUND(total_grossprofit - LAG(total_grossprofit) OVER(ORDER BY YEAR), 2) AS GROSSPROFIT_CHANGE
FROM
	YearlyTOTAL