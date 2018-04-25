SELECT
	SUM(CASE WHEN YEAR(oh.OrderDate) = YEAR(GETDATE()) and MONTH(oh.OrderDate) = MONTH(GETDATE()) and DAY(oh.OrderDate) = DAY(GETDATE()-1) THEN (od.OrderQty * od.UnitPrice) - od.DocDiscount ELSE 0 END) AS YesterdaySales
FROM
	Erp.OrderHed oh with(nolock)

	INNER JOIN Erp.OrderDtl od with(nolock) ON
	od.Company = oh.Company
	AND od.OrderNum = oh.OrderNum
WHERE
	YEAR(oh.OrderDate) >= YEAR(GETDATE()) - 1 
