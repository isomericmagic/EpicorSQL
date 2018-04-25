select
	sum([InvcDtl].[ExtPrice]) as [AmountShipped]
from Erp.InvcDtl as InvcDtl
left outer join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum

inner join Erp.InvcHead as InvcHead on 
	InvcDtl.Company = InvcHead.Company
And
	InvcDtl.InvoiceNum = InvcHead.InvoiceNum

left outer join Erp.Customer as Customer on 
	InvcHead.Company = Customer.Company
And
	InvcHead.CustNum = Customer.CustNum

left outer join Erp.SalesRep as SalesRep on 
	InvcHead.Company = SalesRep.Company
And
	InvcHead.SalesRepList = SalesRep.SalesRepCode
where (MONTH(InvcHead.InvoiceDate) >= '10') and (MONTH(InvcHead.InvoiceDate) < '13') and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE())) AND SalesRep.RepReportsTo = 'HARDWARE' AND (Part.PartNum !='NULL') AND (Part.PartNum != 'NON COMPLIANCE') AND (Part.PartNum != 'VOLUME REBATE') AND (Part.PartNum != 'CO-OP')