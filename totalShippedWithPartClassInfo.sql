select top 500
	[Customer].[CustNum] as [Customer_CustNum],
	[Customer].[Name] as [Customer_Name],
	[InvcDtl].[InvoiceNum] as [InvcDtl_InvoiceNum],
	[InvcHead].[InvoiceDate] as [InvcHead_InvoiceDate],
	[InvcDtl].[OrderLine] as [InvcDtl_OrderLine],
	[InvcDtl].[PartNum] as [InvcDtl_PartNum],
	[InvcDtl].[ExtPrice] as [InvcDtl_ExtPrice],
	[InvcDtl].[OurShipQty] as [InvcDtl_OurShipQty],
	[PartClass].[Description] as [PartClass_Description],
	[SalesRep].[SalesRepCode] as [SalesRep_SalesRepCode],
	[SalesRep].[Name] as [SalesRep_Name],
	[SalesTer].[TerritoryDesc] as [SalesTer_TerritoryDesc]
from Erp.Customer as Customer
inner join Erp.InvcHead as InvcHead on 
	Customer.Company = InvcHead.Company
And
	Customer.CustNum = InvcHead.CustNum

inner join Erp.InvcDtl as InvcDtl on 
	InvcHead.Company = InvcDtl.Company
And
	InvcHead.InvoiceNum = InvcDtl.InvoiceNum

inner join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum

inner join Erp.PartClass as PartClass on 
	Part.Company = PartClass.Company
And
	Part.ClassID = PartClass.ClassID

inner join Erp.SalesTer as SalesTer on 
	Customer.Company = SalesTer.Company
And
	Customer.TerritoryID = SalesTer.TerritoryID
inner join Erp.SalesRep as SalesRep on 
	Customer.Company = SalesRep.Company
And
	Customer.SalesRepCode = SalesRep.SalesRepCode
where (MONTH(InvcHead.InvoiceDate) <= 6) and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE()) -1) and InvcDtl.OurShipQty > 0