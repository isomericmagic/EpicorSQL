select 
	[Customer].[Name] as [Customer_Name],
	[Customer].[CustID] as [Customer_CustID],
	[Customer].[EstDate] as [Customer_EstDate],
	[SalesRep].[Name] as [SalesRep_Name],
	[SalesRep].[RepReportsTo] as [SalesRep_RepReportsTo],
	sum([InvcHead].[InvoiceAmt]) as [Order_Sum]
from Erp.InvcHead as InvcHead
inner join Erp.InvcDtl as InvcDtl on 
	InvcHead.Company = InvcDtl.Company
And
	InvcHead.InvoiceNum = InvcDtl.InvoiceNum
left outer join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum
inner join Erp.Customer as Customer on 
	InvcHead.Company = Customer.Company
And
	InvcHead.CustNum = Customer.CustNum
inner join Erp.SalesRep as SalesRep on 
	InvcHead.Company = SalesRep.Company
And
	InvcHead.SalesRepList = SalesRep.SalesRepCode
where (YEAR(Customer.EstDate) = YEAR(GETDATE())) AND (Part.PartNum !='NULL') AND (Part.PartNum != 'NON COMPLIANCE') AND (Part.PartNum != 'VOLUME REBATE') AND (Part.PartNum != 'CO-OP')
group by [Customer].[Name],[Customer].[CustID],[Customer].[EstDate],[SalesRep].[Name],[SalesRep].[RepReportsTo]
order by Customer.EstDate