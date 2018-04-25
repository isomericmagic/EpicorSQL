select
InvcHead.InvoiceNum as [InvoiceNum],
InvcHead.InvoiceDate as [InvoiceDate],
InvcHead.InvoiceAmt as [InvoiceAmt],
InvcHead.InvoiceBal as [InvoiceBal],
InvcHead.PONum as [PONum],
InvcHead.DueDate as [DueDate]
from Erp.InvcHead as InvcHead
inner join Erp.OrderHed as OrderHed on 
    InvcHead.Company = OrderHed.Company
and
    InvcHead.OrderNum = OrderHed.OrderNum
inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
and
	OrderHed.BTCustNum = Customer.CustNum
inner join Erp.CustCnt as CustCnt on 
	Customer.Company = CustCnt.Company
And
	Customer.CustNum = CustCnt.CustNum
where InvcHead.OrderNum = '{ordernumber}' and [CustCnt].[EMailAddress] = '{emailAddress}'