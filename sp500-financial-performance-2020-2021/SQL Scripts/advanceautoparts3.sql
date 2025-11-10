






SELECT
	firm,
	COUNT(*) AS REPORT_CNT
FROM
	FinancialData
GROUP BY
	firm
HAVING
	COUNT(*) <> 4
ORDER BY
	REPORT_CNT DESC