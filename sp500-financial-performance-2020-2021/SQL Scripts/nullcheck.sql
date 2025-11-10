











USE Financial_Project;

SELECT
	SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS null_date,
	SUM(CASE WHEN firm IS NULL THEN 1 ELSE 0 END) AS null_firm,
	SUM(CASE WHEN Ticker IS NULL THEN 1 ELSE 0 END) AS null_ticker,
	SUM(CASE WHEN [Research Development] IS NULL THEN 1 ELSE 0 END) AS null_rd,
	SUM(CASE WHEN [Income Before Tax] IS NULL THEN 1 ELSE 0 END) AS null_ibt,
	SUM(CASE WHEN [Net Income] IS NULL THEN 1 ELSE 0 END) AS null_netIncome,
	SUM(CASE WHEN [Selling General Administrative] IS NULL THEN 1 ELSE 0 END) AS null_sga,
	SUM(CASE WHEN [Gross Profit] IS NULL THEN 1 ELSE 0 END) AS null_gp,
	SUM(CASE WHEN Ebit IS NULL THEN 1 ELSE 0 END) AS null_ebit,
	SUM(CASE WHEN [Operating Income] IS NULL THEN 1 ELSE 0 END) AS null_oi,
	SUM(CASE WHEN [Interest Expense] IS NULL THEN 1 ELSE 0 END) AS null_ie,
	SUM(CASE WHEN [Income Tax Expense] IS NULL THEN 1 ELSE 0 END) AS null_ite,
	SUM(CASE WHEN [Total Revenue] IS NULL THEN 1 ELSE 0 END) AS null_totalrev,
	SUM(CASE WHEN [Total Operating Expenses] IS NULL THEN 1 ELSE 0 END) AS null_toe,
	SUM(CASE WHEN [Cost Of Revenue] IS NULL THEN 1 ELSE 0 END) AS null_cor,
	SUM(CASE WHEN [Total Other Income Expense Net] IS NULL THEN 1 ELSE 0 END) AS null_toiet,
	SUM(CASE WHEN [Net Income From Continuing Ops] IS NULL THEN 1 ELSE 0 END) AS null_netops,
	SUM(CASE WHEN [Net Income Applicable To Common Shares] IS NULL THEN 1 ELSE 0 END) AS null_netcommon
FROM
	[financial data sp500 companies]