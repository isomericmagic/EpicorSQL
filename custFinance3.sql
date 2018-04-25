SELECT 
Customer.Name,
SUM(InvcDtl.ExtPrice) AS [Total_Credit_Memo]
FROM Erp.InvcHead
INNER JOIN Erp.InvcDtl ON Erp.InvcDtl.Company = Erp.InvcHead.Company and Erp.InvcDtl.InvoiceNum = Erp.InvcHead.InvoiceNum
INNER JOIN Erp.Customer AS Customer ON
	InvcHead.Company = Customer.Company
AND
	InvcHead.CustNum = Customer.CustNum
WHERE (YEAR(InvoiceDate) = YEAR(GETDATE())) and CreditMemo = 1
GROUP BY Customer.Name