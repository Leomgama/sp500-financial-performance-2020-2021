








SELECT
	firm,
	COUNT(DISTINCT Ticker) AS tickers
FROM
	FinancialData
GROUP BY
	firm
HAVING
	COUNT(DISTINCT Ticker) > 1