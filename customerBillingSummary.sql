select
PONum as [PONumber],
OrderNum as [OrderNumber],
InvoiceNum as [InvoiceNumber],
InvoiceDate as [InvoiceDate],
InvoiceAmt as [InvoiceAmount],
InvoiceBal as [InvoiceBalance],
CASE WHEN CreditMemo = '1' THEN 'YES' ELSE 'NO' END as [CreditMemo]
from Erp.InvcHead
where CustNum = '693' and InvoiceDate >= DATEADD(year,-2,GETDATE())
order by InvoiceDate desc