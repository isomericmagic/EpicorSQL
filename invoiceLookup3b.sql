select
InvcMisc.Description as [Description],
InvcMisc.MiscAmt as [MiscAmt]
from Erp.InvcDtl as InvcDtl
inner join Erp.InvcMisc as InvcMisc on 
	InvcDtl.Company = InvcMisc.Company
And
	InvcDtl.InvoiceNum = InvcMisc.InvoiceNum
And
	InvcDtl.InvoiceLine = InvcMisc.InvoiceLine
inner join Erp.InvcHead as InvcHead on 
    InvcDtl.Company = InvcHead.Company
and
    InvcDtl.InvoiceNum = InvcHead.InvoiceNum
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
where InvcDtl.OrderNum = '{ordernumber}' --and [CustCnt].[EMailAddress] = '{emailAddress}'