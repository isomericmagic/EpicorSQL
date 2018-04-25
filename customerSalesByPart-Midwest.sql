select 
	[Part].[PartNum] as [Part_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	sum([InvcDtl].[OurShipQty]) as [InvcDtl_OurShipQty],
	sum([InvcDtl].[ExtPrice]) as [InvcDtl_ExtPrice],
	[Customer].[Name] as [Customer_Name],
	[InvcDtl].[ShipDate] as [InvcDtl_ShipDate]
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
where (InvcHead.InvoiceDate >= '{date1}' and InvcHead.InvoiceDate <= '{date2}') AND [Customer].[CustNum] = '{custnum}' AND [SalesRep].[RepReportsTo] = 'Midwest' AND (Part.PartNum !='NULL') AND (Part.PartNum != 'NON COMPLIANCE') AND (Part.PartNum != 'VOLUME REBATE') AND (Part.PartNum != 'CO-OP')
group by [Part].[PartNum],[Part].[PartDescription],[Part].[ProdCode],[SalesRep].[RepReportsTo],[Customer].[Name],[InvcDtl].[ShipDate]
order by [Customer].[Name]