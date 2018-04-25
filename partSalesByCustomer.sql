select 
	[Part].[ClassID] as [PartClassID],
	[Part].[PartNum] as [PartNum],
	[Part].[PartDescription] as [PartDescription],
	[InvcDtl].[OurShipQty] as [ShipQty],
	[InvcDtl].[ExtPrice] as [AmountSold],
	([InvcDtl].[MtlUnitCost] + [InvcDtl].[LbrUnitCost] + [InvcDtl].[BurUnitCost] + [InvcDtl].[SubUnitCost] + [InvcDtl].[MtlBurUnitCost]) as [UnitCost],
	(([InvcDtl].[MtlUnitCost] + [InvcDtl].[LbrUnitCost] + [InvcDtl].[BurUnitCost] + [InvcDtl].[SubUnitCost] + [InvcDtl].[MtlBurUnitCost]) * [InvcDtl].[OurShipQty]) as [TotalCost],
	[InvcDtl].[InvoiceNum],
	[Customer].[Name] as [Customer],
	[SalesRep].[RepReportsTo] as [SalesRegion],
    [SalesRep].[Name] as [SalesRep],
	[InvcHead].[InvoiceDate] as [Date]
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
where (Part.PartNum !='NULL') AND (Part.PartNum != 'NON COMPLIANCE') --AND (InvcHead.InvoiceDate >= '1/1/16' and InvcHead.InvoiceDate <= '7/31/16')
order by [Part].[ClassID]