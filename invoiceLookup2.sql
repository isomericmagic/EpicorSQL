select
InvcDtl.InvoiceLine as [InvoiceLine],
InvcDtl.PartNum as [PartNum],
InvcDtl.LineDesc as [LineDesc],
InvcDtl.UnitPrice as [UnitPrice],
InvcDtl.OurShipQty as [OurShipQty],
InvcDtl.ExtPrice as [ExtPrice]
from Erp.InvcDtl as InvcDtl
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
where InvcDtl.OrderNum = '{ordernumber}' and [CustCnt].[EMailAddress] = '{emailAddress}'
order by InvcDtl.InvoiceLine asc