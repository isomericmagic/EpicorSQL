select 
	[SalesRep].[RepReportsTo] as [Region],
	sum([InvcDtl].[ExtPrice]) as [AmountShipped]
from Erp.InvcHead as InvcHead
 inner join Erp.InvcDtl as InvcDtl on 
	InvcHead.Company = InvcDtl.Company
And
	InvcHead.InvoiceNum = InvcDtl.InvoiceNum
 and ( (InvcDtl.ExtPrice > 0 ) )

inner join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum
	
inner join Erp.Customer as Customer on 
	InvcHead.Company = Customer.Company
And
	InvcHead.CustNum = Customer.CustNum

inner join Erp.SalesRep as SalesRep on 
	Customer.Company = SalesRep.Company
And
	Customer.SalesRepCode = SalesRep.SalesRepCode
--where (DAY(InvcHead.InvoiceDate) = DAY(GETDATE())) and (MONTH(InvcHead.InvoiceDate) = MONTH(GETDATE())) and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE())) AND SalesRep.RepReportsTo IN ('EAST','WEST', 'MIDWEST', 'HARDWARE')
--where (MONTH(InvcHead.InvoiceDate) = MONTH(GETDATE())) and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE())) AND SalesRep.RepReportsTo IN ('EAST','WEST', 'MIDWEST', 'HARDWARE') 
where (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE())-1)
group by [SalesRep].[RepReportsTo] 