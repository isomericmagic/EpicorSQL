SELECT SUM(InvcDtl.ExtPrice) AS [Total_Credit_Memo]
FROM Erp.InvcHead
INNER JOIN Erp.InvcDtl ON Erp.InvcDtl.Company = Erp.InvcHead.Company and Erp.InvcDtl.InvoiceNum = Erp.InvcHead.InvoiceNum
WHERE InvcHead.CustNum = '{customernumber}' and (YEAR(InvoiceDate) = YEAR(GETDATE())) and CreditMemo = 1