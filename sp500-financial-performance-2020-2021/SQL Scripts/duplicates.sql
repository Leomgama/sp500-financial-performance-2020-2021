












SELECT
	firm,
	Ticker,
	date,
	COUNT(*) AS cnt
FROM
	FinancialData
GROUP BY
	firm,
	Ticker,
	date
HAVING
	COUNT(*) > 1

WITH DUPLICATES
AS
(
	SELECT
		*,
		ROW_NUMBER() OVER (PARTITION BY firm, Ticker, date ORDER BY date) AS RRN
	FROM
		FinancialData
)
DELETE FROM DUPLICATES WHERE RRN > 1