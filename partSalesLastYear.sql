select 
	[Part].[ClassID] as [Part_PartClassID],
	[Part].[PartNum] as [Part_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	sum([InvcDtl].[OurShipQty]) as [InvcDtl_OurShipQty],
	sum([InvcDtl].[ExtPrice]) as [InvcDtl_ExtPrice]
from Erp.InvcDtl as InvcDtl
inner join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum

inner join Erp.InvcHead as InvcHead on 
	InvcDtl.Company = InvcHead.Company
And
	InvcDtl.InvoiceNum = InvcHead.InvoiceNum

inner join Erp.Customer as Customer on 
	InvcHead.Company = Customer.Company
And
	InvcHead.CustNum = Customer.CustNum

inner join Erp.SalesRep as SalesRep on 
	Customer.Company = SalesRep.Company
And
	Customer.SalesRepCode = SalesRep.SalesRepCode
where ((MONTH(InvcHead.InvoiceDate) < MONTH(GETDATE())) or (MONTH(InvcHead.InvoiceDate) = MONTH(GETDATE())) and DAY(InvcHead.InvoiceDate) <= DAY(GETDATE())) and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE())-1)
group by [Part].[PartNum],[Part].[PartDescription],[Part].[ClassID]