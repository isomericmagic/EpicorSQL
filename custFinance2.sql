SELECT 
Customer.Name,
Count(DISTINCT InvcHead.InvoiceNum) AS [Number_Of_Invoices],
AVG(DATEDIFF(dd, InvoiceDate, ClosedDate)) AS [Average_Days_To_Pay]
FROM Erp.InvcHead
INNER JOIN Erp.InvcDtl ON Erp.InvcDtl.Company = Erp.InvcHead.Company and Erp.InvcDtl.InvoiceNum = Erp.InvcHead.InvoiceNum 
INNER JOIN Erp.Customer AS Customer ON
	InvcHead.Company = Customer.Company
AND
	InvcHead.CustNum = Customer.CustNum
WHERE (YEAR(InvoiceDate) = YEAR(GETDATE()))
GROUP BY Customer.Name