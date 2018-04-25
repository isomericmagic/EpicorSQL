SELECT
	SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE()) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS  TotalSales
FROM
	Erp.OrderHed oh with(nolock)

	INNER JOIN Erp.OrderDtl od with(nolock) ON
	od.Company = oh.Company
	AND od.OrderNum = oh.OrderNum

	INNER JOIN Erp.ProdGrup pg with(nolock) ON
	pg.Company = od.Company
	AND pg.ProdCode = od.ProdCode
WHERE
	YEAR(oh.OrderDate) >= YEAR(GETDATE()) - 1 