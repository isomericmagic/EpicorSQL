SELECT Count(DISTINCT InvcHead.InvoiceNum) AS [Number_Of_Invoices],
AVG(DATEDIFF(dd, InvoiceDate, ClosedDate)) AS [Average_Days_To_Pay]
FROM Erp.InvcHead
INNER JOIN Erp.InvcDtl ON Erp.InvcDtl.Company = Erp.InvcHead.Company and Erp.InvcDtl.InvoiceNum = Erp.InvcHead.InvoiceNum 
WHERE InvcHead.CustNum = '{customernumber}' and (YEAR(InvoiceDate) = YEAR(GETDATE())-1)