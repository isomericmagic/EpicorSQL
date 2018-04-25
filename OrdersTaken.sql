SELECT
	pg.Description AS ProductGroup
	, MONTH(oh.OrderDate) AS Month
	, SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE()) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS  TotalSales
	, SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE())-1 THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS  LastYearTotalSales
	, SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE()) and MONTH(oh.OrderDate) = MONTH(GETDATE()) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS  MtdSales
	, SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE())-1 and MONTH(oh.OrderDate) = MONTH(GETDATE()) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS  LastYearMtdSales
	, SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE()) and MONTH(oh.OrderDate) = MONTH(GETDATE()) and DAY(oh.OrderDate) = DAY(GETDATE()) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS TodaySales
	, SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE())-1 and MONTH(oh.OrderDate) = MONTH(GETDATE()) and DAY(oh.OrderDate) = DAY(GETDATE()) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS LastYearTodaySales
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
GROUP BY
	pg.Description
	, MONTH(oh.OrderDate)
