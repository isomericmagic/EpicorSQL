SELECT 
	Customer.Name,
	SUM([InvcDtl].[ExtPrice]) AS [Total_Revenue],
	SUM(InvcDtl.OurShipQty*(InvcDtl.MtlUnitCost + InvcDtl.LbrUnitCost + InvcDtl.BurUnitCost + InvcDtl.SubUnitCost + InvcDtl.MtlBurUnitCost)) AS [Total_Cost]
FROM Erp.InvcHead AS InvcHead
 INNER JOIN Erp.InvcDtl AS InvcDtl ON 
	InvcHead.Company = InvcDtl.Company
AND
	InvcHead.InvoiceNum = InvcDtl.InvoiceNum
 AND ( (InvcDtl.ExtPrice > 0 ) )

INNER JOIN Erp.Part AS Part ON 
	InvcDtl.Company = Part.Company
AND
	InvcDtl.PartNum = Part.PartNum
INNER JOIN Erp.Customer AS Customer ON
	InvcHead.Company = Customer.Company
AND
	InvcHead.CustNum = Customer.CustNum
WHERE (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE())) 
GROUP BY Customer.Name