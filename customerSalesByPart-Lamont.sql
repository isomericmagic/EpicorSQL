select 
	[Part].[PartNum] as [Part_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	sum([InvcDtl].[OurShipQty]) as [InvcDtl_OurShipQty],
	sum([InvcDtl].[ExtPrice]) as [InvcDtl_ExtPrice],
	[Customer].[Name] as [Customer_Name],
	[InvcDtl].[ShipDate] as [InvcDtl_ShipDate]
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
where (InvcHead.InvoiceDate >= '{date1}' and InvcHead.InvoiceDate <= '{date2}') AND [Customer].[CustNum] = '{custnum}' AND Customer.CustNum IN (3942,227,6056,231,6396,1948,316,319,317,693,6516,1372,6491,6673,1966,6588,2038,2039,6418,2218,2219,2574,6560,3854,4285,4572,6461,4796,3176,6357)
group by [Part].[PartNum],[Part].[PartDescription],[Part].[ProdCode],[SalesRep].[RepReportsTo],[Customer].[Name],[InvcDtl].[ShipDate]
order by [Customer].[Name]